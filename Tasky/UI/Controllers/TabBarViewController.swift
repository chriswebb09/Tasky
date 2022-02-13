//
//  TabBarViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

enum Tab {
    
    case news
    case boomarks
    case settings
    
    var image: UIImage? {
        switch self {
        case .news:
            return UIImage(systemName: AppConstants.ImageAssets.newspaper)
        case .boomarks:
            return UIImage(systemName: AppConstants.ImageAssets.bookmark)
        case .settings:
            return UIImage(systemName: AppConstants.ImageAssets.settings)
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .news:
            return UIImage(systemName: AppConstants.ImageAssets.newspaperFilled)
        case .boomarks:
            return UIImage(systemName: AppConstants.ImageAssets.bookmarkFilled)
        case .settings:
            return UIImage(systemName: AppConstants.ImageAssets.settingsFilled)
        }
    }
}

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        tabBar.backgroundColor = UIColor.clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()  // removes the border
        setupTabBarStyle()
    }
    
    func setupTabBarStyle() {
        let rect = CGRect(x: AppConstants.UIConstants.Tabbar.xOffset, y: tabBar.bounds.minY - AppConstants.UIConstants.Tabbar.yOffset, width: tabBar.bounds.width - AppConstants.UIConstants.Tabbar.widthOffset, height: tabBar.bounds.height + AppConstants.UIConstants.Tabbar.heightOffset)
        tabBar.createLayer(rect: rect)
        tabBar.itemWidth = AppConstants.UIConstants.Tabbar.itemWidth
        tabBar.itemPositioning = .centered
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
