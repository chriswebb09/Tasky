//
//  TasksViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class TasksViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

// MARK: - Factory

extension TasksViewController {
    static func getTaskVC() -> TasksViewController {
        let vc = TasksViewController()
        let item = UITabBarItem(title: nil, image: Tab.stats.image, selectedImage: Tab.stats.selectedImage)
        vc.tabBarItem = item
        return vc
    }
}
