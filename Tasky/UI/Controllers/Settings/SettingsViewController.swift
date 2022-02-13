//
//  SettingsViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Settings"
    }
}

// MARK: - Factory

extension SettingsViewController {
    static func getSettingsVC() -> SettingsViewController {
        let vc = SettingsViewController()
        let item = UITabBarItem(title: Tab.settings.text, image: Tab.settings.image, selectedImage: Tab.settings.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
