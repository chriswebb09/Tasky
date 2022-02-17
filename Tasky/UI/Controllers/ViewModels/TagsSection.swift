//
//  FavoritesSection.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

class TagsSection: Hashable {
    
    var sectionTitle: String = "Tags"
    
    var media: [Tag]?
    
    init(media: [Tag]) {
        self.media = media
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: TagsSection, rhs: TagsSection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
