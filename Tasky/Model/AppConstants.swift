//
//  AppConstants.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

// MARK: - AppConstants

struct AppConstants {
    
    // MARK: - Storage
    
    struct Storage {
        static let tasksPath = "tasks.json"
        static let firstRunKey = "firstruncomplete"
        static let imageKey =  "image"
    }
    
    // MARK: - Strings
    
    struct Strings {
        static let removeCacheMessage = NSLocalizedString("Remove articles from cache?", comment: "")
        static let languageChoiceMessage = NSLocalizedString("Select your preferred language.", comment: "")
        static let resetMessage = NSLocalizedString("This will reset all articles to unread and remove all bookmarks. Would you like to continue?", comment: "")
    }
    
    // MARK: - ImageAssets
    
    struct ImageAssets {
        static let home = "house"
        static let homeFilled = "house.fill"
        static let favorite = "heart"
        static let favoriteFilled = "heart.fill"
        static let newspaper = "newspaper"
        static let newspaperFilled = "newspaper.fill"
        static let settings = "gearshape"
        static let settingsFilled = "gearshape.fill"
        static let chevronLeft = "chevron.left"
        static let bookmark = "bookmark"
        static let bookmarkFilled = "bookmark.fill"
        static let bookmarkCirlcle = "bookmark.circle"
        static let bookmarkCirlceFilled = "bookmark.circle.fill"
        static let share = "square.and.arrow.up"
        static let shareFilled = "square.and.arrow.up.fill"
        static let chevronRight = "chevron.right"
        static let checkmark = "checkmark"
        static let rectange = "rectangle.fill"
    }
    
    // MARK: - UIConstants
    
    struct UIConstants {
        
        
        struct Tabbar {
            static let xOffset: CGFloat = 30
            static let yOffset: CGFloat = 10
            static let widthOffset: CGFloat = 60
            static let heightOffset: CGFloat = 10
            static let itemWidth: CGFloat = 50
        }
    }
}


