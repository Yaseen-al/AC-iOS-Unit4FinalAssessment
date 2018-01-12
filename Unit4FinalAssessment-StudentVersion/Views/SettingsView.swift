//
//  SettingsView.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/12/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation
import UIKit
class SettingsView: UIView {
    lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomSettingsTableViewCell.self, forCellReuseIdentifier: "settingsCell")
        return tableView
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = .orange
        setupViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        setupTableView()
    }
    func setupTableView(){
        addSubview(settingsTableView)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        settingsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        settingsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        settingsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}
