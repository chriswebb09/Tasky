//
//  NewListViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class NewListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "New"
    }
}

// MARK: - Factory

extension NewListViewController {
    static func getNewListVC() -> NewListViewController {
        let vc = NewListViewController()
        let item = UITabBarItem(title: Tab.new.text, image: Tab.new.image, selectedImage: Tab.new.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
