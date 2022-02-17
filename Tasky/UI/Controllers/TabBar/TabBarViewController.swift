//
//  TabBarViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class BaseViewController: UIViewController { }

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = UIColor.backgroundColor
            //.clear
    }
    
    func setupTabBarStyle() {
        let rect = CGRect(x: 20, y: tabBar.bounds.minY + 5, width: tabBar.bounds.width - 20, height: tabBar.bounds.height + 50)
        tabBar.createLayer2(rect: rect)
        tabBar.itemWidth = AppConstants.UIConstants.Tabbar.itemWidth
        tabBar.itemPositioning = .centered
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.origin.y = view.frame.height - 100
    }
}

// MARK: - Factory

extension TabBarViewController {
    
    static func makeTabbar(viewControllers: [UIViewController]) -> UITabBarController {
        let tabbar = TabBarViewController()
        var navVCs = [UINavigationController]()
        for vc in viewControllers {
            let navVC = UINavigationController(rootViewController: vc)
            navVCs.append(navVC)
        }
        tabbar.viewControllers = navVCs
        tabbar.tabBar.tintColor = UIColor.customGray
        return tabbar
    }
}
