//
//  TabBarViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make the navigation bar's title with red text.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemRed
        appearance.titleTextAttributes = [.foregroundColor: UIColor.lightText] // With a red background, make the title more readable.
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance // For iPhone small navigation bar in landscape.
        
        // Make all buttons with green text.
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGreen]
        navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
        navigationItem.compactAppearance?.buttonAppearance = buttonAppearance // For iPhone small navigation bar in landscape.
        
        // Make the done style button with yellow text.
        let doneButtonAppearance = UIBarButtonItemAppearance()
        doneButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemYellow]
        navigationItem.standardAppearance?.doneButtonAppearance = doneButtonAppearance
        navigationItem.compactAppearance?.doneButtonAppearance = doneButtonAppearance // For iPhone small navigation bar in landscape.
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}

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
