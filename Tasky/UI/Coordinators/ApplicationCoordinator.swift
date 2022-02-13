//
//  ApplicationCoordinator.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var window: UIWindow
    var rootController: UIViewController!
    
    private let homeVC = HomeViewController.getHomeVC()
    private let settingsVC = SettingsViewController.getSettingsVC()
    private let newListVC = NewListViewController.getNewListVC()
    
    init(window: UIWindow) {
        self.window = window
        rootController = TabBarViewController.makeTabbar(viewControllers: [homeVC, newListVC, settingsVC])
    }
    
    func start() {
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}
