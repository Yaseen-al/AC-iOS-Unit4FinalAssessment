//
//  SettingsViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

enum PropertyName: String {
    case widthMultiplier = "Width Multiplier"
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
    var properties: [[AnimationProperty]] =
    [
        [AnimationProperty(name: .widthMultiplier, stepperMin: 0, stepperMax: 1.0, stepperIncrement: 0.1, startingStepperVal: 0.0)]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //This will add the settings view
        view.addSubview(settingsView)
        //This will assign the delgates for my settings tableView
        self.settingsView.settingsTableView.delegate = self
        self.settingsView.settingsTableView.dataSource = self
        setupAddButton()
//        view.addSubview(tableView)
        navigationItem.title = "Settings"
//        layoutTableView()
    }
    func setupAddButton(){
        let addButton = UIBarButtonItem(image: #imageLiteral(resourceName: "add-anchor-point"), style: .plain, target: self, action: #selector(addButtonAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonAction(){
        
    }
    
    func layoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        //TO DO: Register your subclass
        return tv
    }()
}

extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
//        return properties.count
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TO DO: Implement your Custom Cell that has a stepper
//        let property = properties[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! CustomSettingsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return properties[section].count
        return 10
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Size Settings"
        //TO DO: Handle other sections
        default:
            return "Other Settings"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}











