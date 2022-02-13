//
//  SettingsViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class SettingsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

// MARK: - Factory

extension SettingsViewController {
    static func getSettingsVC() -> SettingsViewController {
        let vc = SettingsViewController()
        let item = UITabBarItem(title: nil, image: Tab.settings.image, selectedImage: Tab.settings.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
