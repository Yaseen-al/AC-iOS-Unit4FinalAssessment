//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
enum AnimationKeys: String {
    case BorderColor = "Border Color"
    case BorderShadowColor = "Border Shadow Color"
    case BorderWidth = "Border Width"
    case CornerRadius = "Corner Radius"
    case AnimateScale = "animate Scale"
    case BorderShadowOpacity = "Shadow Opacity"
    case AnimateRotationZ = "Animate Rotation Z"
    case AnimateRotationY = "Animate Rotation Y"
    case AnimateRotationx = "Animate Rotation x"
    case AnimateTranslation = "Animate Translation"
    case AnimateContent =  "Animate Content"
}
class AnimationViewController: UIViewController {
    var animationProperty: AnimationKeys = AnimationKeys.BorderShadowColor
    let animations = [AnimationKeys.AnimateContent, AnimationKeys.AnimateRotationx, AnimationKeys.AnimateScale]
    let animationView = AnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(animationView)
        self.animationView.backGroundView.image = #imageLiteral(resourceName: "snow Image")
            self.animationView.imageView.image = #imageLiteral(resourceName: "snowman-1")
        self.view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.9, alpha: 1.0)
        // setup picker delegates
        self.animationView.animationPickerView.dataSource = self
        self.animationView.animationPickerView.delegate = self
        setupAnimationButton()
    }
    func setupAnimationButton(){
        self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: UIControlState.normal)
        self.animationView.animationButton.layer.shadowOpacity = 0.15
        self.animationView.animationButton.addTarget(self, action: #selector(animationButtonAction), for: .touchUpInside)
//        self.animationView.animationButton.setImage(#imageLiteral(resourceName: "stop-button"), for: UIControlState.selected)
    }
    @objc func animationButtonAction(){
        print("Yoooo stop presing on me")
        self.animationView.animationButton.setImage(#imageLiteral(resourceName: "stop-button"), for: .highlighted)
    
    }
    
}

extension AnimationViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return animations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return animations[row].rawValue
    }
}

extension AnimationViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // TODO selecting a cell in a picker will change a animation property
    }
}







