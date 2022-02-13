//
//  TabBarViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        lineView.backgroundColor = UIColor.darkGray
        self.tabBar.addSubview(lineView)
        self.tabBar.backgroundColor = .white
        setupTabBarStyle()
    }
    
    func setupTabBarStyle() {
        tabBar.itemWidth = AppConstants.UIConstants.Tabbar.itemWidth
        tabBar.itemPositioning = .centered
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 95
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
