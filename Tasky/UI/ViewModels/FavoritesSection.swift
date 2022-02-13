//
//  FavoritesSection.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

class FavoritesSection: Hashable {
    
    var sectionTitle: String = "Popular Movies"
    
    var media: [List]?
    
    init(media: [List]) {
        self.media = media
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: FavoritesSection, rhs: FavoritesSection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
