//
//  NewListViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class NewListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

// MARK: - Factory

extension NewListViewController {
    static func getNewListVC() -> NewListViewController {
        let vc = NewListViewController()
        let item = UITabBarItem(title: nil, image: Tab.new.image, selectedImage: Tab.new.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
