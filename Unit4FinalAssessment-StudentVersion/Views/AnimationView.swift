//
//  AnimationView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
class AnimationView: UIView {
    lazy var animationButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = #imageLiteral(resourceName: "Play Button")
        return button
    }()
    lazy var animationPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    lazy var backGroundView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        imageView.contentMode = .scaleAspectFill
        //     for blurEffect   https://stackoverflow.com/questions/30953201/adding-blur-effect-to-background-in-swift
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = imageView.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
//        imageView.addSubview(blurEffectView)
        return imageView
    }()
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "This is going to be The header label"
        return label
    }()
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubview(backGroundView)
        setupHeaderLabel()
        setupImageView()
        setupAnimationPickerView()
        setupAnimatioButton()
    }
    
    func setupHeaderLabel(){
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85).isActive = true
        imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.45).isActive = true
    }
    func setupAnimationPickerView(){
        
        addSubview(animationPickerView)
        animationPickerView.translatesAutoresizingMaskIntoConstraints = false
        animationPickerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationPickerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        animationPickerView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.85).isActive = true
        animationPickerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.25).isActive = true
    }
    func setupAnimatioButton(){
        
        addSubview(animationButton)
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        animationButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        animationButton.topAnchor.constraint(equalTo: animationPickerView.bottomAnchor, constant: 20).isActive = true
    }

}
