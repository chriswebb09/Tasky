//
//  CategoreySection.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

class CategoreySection: Hashable {
    
    var sectionTitle: String = "Categories"
    
    var categories: [List]?
    
    init(categories: [List]) {
        self.categories = categories
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: CategoreySection, rhs: CategoreySection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
