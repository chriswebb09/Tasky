//
//  Tab.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

enum Tab {
    
    case home
    case list
    case new
    case stats
    case settings
    
    
    var text: String? {
        switch self {
        case .home:
            return "Home"
        case .list:
            return "List"
        case .new:
            return "New"
        case .stats:
            return "Statistics"
        case .settings:
            return "Settings"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: AppConstants.ImageAssets.grid)
        case .list:
            return UIImage(systemName: AppConstants.ImageAssets.listBullet)
        case .new:
            return UIImage(systemName: AppConstants.ImageAssets.plusCircle)
        case .stats:
            return UIImage(systemName: AppConstants.ImageAssets.statistics)
        case .settings:
            return UIImage(systemName: AppConstants.ImageAssets.settings2)
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: AppConstants.ImageAssets.gridFilled)
        case .list:
            return UIImage(systemName: AppConstants.ImageAssets.listBullet)
        case .new:
            return UIImage(systemName: AppConstants.ImageAssets.plusCircle)
        case .stats:
            return UIImage(systemName: AppConstants.ImageAssets.statistics)
        case .settings:
            return UIImage(systemName: AppConstants.ImageAssets.settings2)
        }
    }
}
