//
//  CustomSettingsTableViewCell.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit

class CustomSettingsTableViewCell: UITableViewCell {
    lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    lazy var cellLable: UILabel = {
        let label = UILabel()
        label.text = "This is going to be your settings Values: 124"
        return label
    }()
    lazy var cellStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.tintColor = .blue
        stepper.backgroundColor = UIColor.lightText
        stepper.layer.shadowOpacity = 0.10
        stepper.tintColorDidChange()
        return stepper
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        // this is the where you add the reuseIdentifier
        super.init(style: style, reuseIdentifier: "settingsCell")
//        backgroundColor = .orange
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        setupImage()
        setupCellLabel()
        setupStepper()
    }
    func setupImage(){
        addSubview(cellImage)
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        cellImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        cellImage.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
    }
    func setupCellLabel(){

        addSubview(cellLable)
        cellLable.translatesAutoresizingMaskIntoConstraints = false
        cellLable.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        cellLable.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        cellLable.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.45).isActive = true
    }
    func setupStepper(){
        addSubview(cellStepper)
        cellStepper.translatesAutoresizingMaskIntoConstraints = false
        cellStepper.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        cellStepper.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        cellStepper.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25).isActive = true
    }
    
}
