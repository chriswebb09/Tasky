//
//  Tab.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

enum Tab {
    
    case home
    case new
    case settings
    
    var text: String? {
        switch self {
        case .home:
            return "Home"
        case .new:
            return "New"
        case .settings:
            return "Settings"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: AppConstants.ImageAssets.home)
        case .new:
            return UIImage(systemName: AppConstants.ImageAssets.plusCircle)
        case .settings:
            return UIImage(systemName: AppConstants.ImageAssets.settings)
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: AppConstants.ImageAssets.homeFilled)
        case .new:
            return UIImage(systemName: AppConstants.ImageAssets.plusCircle)
        case .settings:
            return UIImage(systemName: AppConstants.ImageAssets.settingsFilled)
        }
    }
}
