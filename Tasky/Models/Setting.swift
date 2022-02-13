//
//  Setting.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

enum Setting: CaseIterable {
    
    case reset
    case language
    case resetCachedData
    
    static var elements: [Self] {
        return allCases
    }
    
    var title: String {
        switch self {
        case .reset:
            return "Reset Settings"
        case .language:
            return "Language"
        case .resetCachedData:
            return "Reset Articles"
        }
    }
    
    var displayMessage: String {
        switch self {
        case .resetCachedData:
            return AppConstants.Strings.removeCacheMessage
        case .language:
            return AppConstants.Strings.languageChoiceMessage
        case .reset:
            return AppConstants.Strings.resetMessage
        }
    }
}

// MARK: - Hashable

extension Setting: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (lhs: Setting, rhs: Setting) -> Bool {
        return lhs.title == rhs.title
    }
}
