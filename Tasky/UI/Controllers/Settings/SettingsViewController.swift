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
        self.view.backgroundColor = .red
    }
}

// MARK: - Factory

extension SettingsViewController {
    static func getSettingsVC() -> SettingsViewController {
        let vc = SettingsViewController()
        let item = UITabBarItem(title: nil, image: Tab.news.image, selectedImage: Tab.news.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}