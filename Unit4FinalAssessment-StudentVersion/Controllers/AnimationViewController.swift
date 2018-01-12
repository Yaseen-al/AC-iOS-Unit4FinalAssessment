//
//  AnimationViewController.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q  on 1/11/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import SceneKit

enum AnimationKeys: String {
    case AnimateRotationZ = "Animate Rotation Z"
    case BorderShadowColor = "Border Shadow Color"
    case ExitToCornerWithRevers = "Exit to Corner"
}
class AnimationViewController: UIViewController {
    var animator: UIViewPropertyAnimator!
    private var originalPosition = CGRect()
    var topPosition = CGRect()
    var buttomPosition = CGRect()
    private let originAngle:CGFloat = 0
    var firstAngle: CGFloat = 0
    var secondAngle: CGFloat = 0
    //animations array
    let animations = [AnimationKeys.ExitToCornerWithRevers, AnimationKeys.BorderShadowColor, AnimationKeys.AnimateRotationZ]
    var currentAnimationProperty: AnimationKeys = AnimationKeys.BorderShadowColor
    
    let animationView = AnimationView()
    var animatingStatus = true
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
    override func viewDidAppear(_ animated: Bool) {
        self.originalPosition = self.animationView.imageView.frame
    }
    func setupAnimationButton(){
        self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: UIControlState.normal)
        self.animationView.animationButton.layer.shadowOpacity = 0.15
        self.animationView.animationButton.addTarget(self, action: #selector(animationButtonAction), for: .touchUpInside)
        //        self.animationView.animationButton.setImage(#imageLiteral(resourceName: "stop-button"), for: UIControlState.selected)
    }
    @objc func animationButtonAction(){
        switch self.currentAnimationProperty {
        case .ExitToCornerWithRevers:
            print("Yoooo stop presing on me")
            if animatingStatus{
                exitToCornerWithRevers()
                self.animationView.animationButton.setImage(#imageLiteral(resourceName: "stop-button"), for: .normal)
                self.resume(layer: self.animationView.imageView.layer)
                animatingStatus = false
            }else{
                self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
                //for pausing
                self.pause(layer: self.animationView.imageView.layer)
                animatingStatus = true
            }
        case .BorderShadowColor:
            print("Yoooo stop presing on me")
            if animatingStatus{
                animateBorderShadowOpacity()
                self.animationView.animationButton.setImage(#imageLiteral(resourceName: "stop-button"), for: .normal)
                self.resume(layer: self.animationView.imageView.layer)
                animatingStatus = false
            }else{
                self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
                //for pausing
                self.pause(layer: self.animationView.imageView.layer)
                animatingStatus = true
            }
        case .AnimateRotationZ:
            if animatingStatus{
                animateRotationZ()
                self.animationView.animationButton.setImage(#imageLiteral(resourceName: "stop-button"), for: .normal)
                self.resume(layer: self.animationView.imageView.layer)
                animatingStatus = false
            }else{
                self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
                //for pausing
                self.pause(layer: self.animationView.imageView.layer)
                animatingStatus = true
            }
        }

    }
    func animateRotationZ() {
        UIView.animate(withDuration: 3, animations: {
            self.animateZ()
        }, completion: {(success) in
            print("finished animation")
            self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
            self.animatingStatus = true
        })
        
    }
    func animateZ() {
        let transformRotaion = CABasicAnimation(keyPath: "transform.rotation.z")
        transformRotaion.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transformRotaion.fromValue = 0
        transformRotaion.byValue = CGFloat(2.0 * .pi)
        transformRotaion.duration = 2.0
        self.animationView.imageView.layer.add(transformRotaion, forKey: nil)
        self.animationView.imageView.layer.transform = CATransform3DMakeRotation(CGFloat(2.0 * .pi), 0, 0, 1)
    }
    
    func animateBorderShadowOpacity(){
        UIView.animate(withDuration: 3, animations: {
            let animatation = CABasicAnimation(keyPath: "shadowOpacity")
            animatation.fromValue = 0.0
            animatation.toValue = 1.0
            animatation.duration = 5
            self.animationView.imageView.layer.add(animatation, forKey: nil)
            self.animationView.imageView.layer.shadowOpacity = 2.0
            let offsetAnimation = CABasicAnimation(keyPath: "shadowOffset")
            offsetAnimation.fromValue = CGSize.zero
            offsetAnimation.toValue = CGSize(width: 5.0, height: 5.0)
            offsetAnimation.duration = 5
            self.animationView.imageView.layer.add(offsetAnimation, forKey: nil)
            self.animationView.imageView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        }, completion: {(success) in
            
            self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
            self.animationView.imageView.layer.shadowOpacity = 0.0
            self.animatingStatus = true
        })
        
    }
    func exitToCornerWithRevers() {
        UIView.animate(withDuration: 3, animations: {
            self.animateRotationX()
            self.animationView.imageView.frame = self.topPosition
            self.secondAngle =  self.firstAngle + CGFloat.pi
            self.animationView.imageView.transform = CGAffineTransform.init(rotationAngle: self.secondAngle)
            self.firstAngle = self.secondAngle
        }, completion: {(success) in
            print("fiished animation")
            self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
            self.enterFromTheCorner()
            self.animatingStatus = true
        })
    }
    func enterFromTheCorner() {
        UIView.animate(withDuration: 3, animations: {
            self.animationView.imageView.frame = self.originalPosition
            self.secondAngle =  self.firstAngle + CGFloat.pi
            self.animationView.imageView.transform = CGAffineTransform.init(rotationAngle: self.secondAngle)
            self.firstAngle = self.secondAngle
        }, completion: {(success) in
            print("fiished animation")
            self.animationView.animationButton.setImage(#imageLiteral(resourceName: "PlayButton size 64"), for: .normal)
            self.animationView.imageView.frame = self.originalPosition
            self.animatingStatus = true
        })
    }
    func animateRotationX() {
        let transformRotaion = CABasicAnimation(keyPath: "transform.rotation.x")
        transformRotaion.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        transformRotaion.fromValue = 0
        transformRotaion.byValue = CGFloat(2.0 * .pi)
        transformRotaion.duration = 2.0
        animationView.imageView.layer.add(transformRotaion, forKey: nil)
        animationView.imageView.layer.transform = CATransform3DMakeRotation(CGFloat(2.0 * .pi), 0, 0, 1)
    }
    func pause(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0
        layer.timeOffset = pausedTime
    }
    
    func resume(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1
        layer.timeOffset = 0
        layer.beginTime = 0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
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
        let animationSetup = animations[row]
        self.currentAnimationProperty = animationSetup
        
    }
}







