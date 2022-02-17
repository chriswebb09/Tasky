//
//  Tag.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import Foundation

class Tag: Codable {
    var id: String
    var subject: String
    
    init(subject: String, id: String) {
        self.id = id
        self.subject = subject
    }
}

// MARK: - Hashable

extension Tag: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(subject)
    }
    
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.subject == rhs.subject
    }
}

class ListTag: Tag { }


class TaskTag: Tag { }
