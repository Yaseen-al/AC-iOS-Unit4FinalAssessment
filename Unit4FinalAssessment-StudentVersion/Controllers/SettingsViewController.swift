//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//https://stackoverflow.com/questions/31922349/how-to-add-textfield-to-uialertcontroller-in-swift

//Read Me ====================
// I am still working on the selector function to make it take properties in order to keep track of section and row I have tried to keep track of section in the button but the button takes only an integer.. I will appreciate any other ideas if I couldn't find an answer.

import UIKit

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
    case heightMultiplier = "Heigh Multiplier"
    case horizontalOffset = "Horizontal Offset"
    case verticalOffset = "Vertical Offset"
    //TO DO: Add other PropertyName Cases
}

struct AnimationProperty {
    let name: PropertyName
    let stepperMin: Double
    let stepperMax: Double
    let stepperIncrement: Double
    let startingStepperVal: Double
}

class SettingsViewController: UIViewController {
    let settingsView = SettingsView()
    //TO DO: Add more properties
    let tagKeeper = [Int]()
    let width = 20
    let height = 100
    let horizontalOffset = 20
    let verticalOffset = 10
    
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 300, stepperIncrement: 0.1, startingStepperVal: 0.0), AnimationProperty(name: .heightMultiplier, stepperMin: 0, stepperMax: 200, stepperIncrement: 0.1, startingStepperVal: 0.0)],
        [AnimationProperty(name: .horizontalOffset, stepperMin: 0, stepperMax: 20, stepperIncrement: 0.1, startingStepperVal: 0.0),
         AnimationProperty(name: .verticalOffset, stepperMin: 0, stepperMax: 20, stepperIncrement: 0.1, startingStepperVal: 0.0)]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //This will add the settings view
        view.addSubview(settingsView)
        //This will assign the delgates for my settings tableView
        self.settingsView.settingsTableView.delegate = self
        self.settingsView.settingsTableView.dataSource = self
        setupAddButton()
        navigationItem.title = "Settings"

    }
    func setupAddButton(){
        let addButton = UIBarButtonItem(image: #imageLiteral(resourceName: "add-anchor-point"), style: .plain, target: self, action: #selector(addButtonAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonAction(){
        let alert = UIAlertController(title: "Do you want to save Settings", message: "", preferredStyle: .alert)
        alert.addTextField(configurationHandler: { (textField : UITextField!) in
            textField.placeholder = "Add Settings Name"
        })
        let saveAction = UIAlertAction(title: "Ok", style: .default){(handler) in
            let savedSetting = Setting(width: self.width, heigh: self.height, horizontalOffset: self.horizontalOffset, verticalOffset: self.verticalOffset)
            FileManagerHelper.shared.addSettingToList(setting: savedSetting)

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return properties.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
        let propertySetup = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! CustomSettingsTableViewCell
        // assign index path of the stepper to capture it on the function
        cell.cellStepper.tag = indexPath.row
        cell.cellStepper.maximumValue = propertySetup.stepperMax
        cell.cellStepper.minimumValue = propertySetup.stepperMin
        cell.cellStepper.autorepeat = true
        cell.cellLable.text = propertySetup.name.rawValue
//        cell.cellStepper.addTarget(self, action: #selector(stepperValueChanged(sender:section:)), for: .valueChanged)
        cell.cellStepper.addTarget(self, action: #selector(stepperValueChanged(sender:section:)), for: .valueChanged)
        return cell
    }
    @objc func stepperValueChanged(sender:UIStepper!, section: Int)
    {
        if sender.tag < 2{
            print("It Works, Value is --&gt;\(Int(sender.value).description)")
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties[section].count
    }
}

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        case 1:
            return "Height Multiplier"
        //TO DO: Handle other sections
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}










