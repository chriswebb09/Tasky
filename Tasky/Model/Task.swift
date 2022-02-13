//
//  Task.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

// MARK: - Task

struct Task: Codable {
    var id: String
    var title: String
    var description: String
    var dateCreated: Date
    var parentListId: String
    var priorty: Priority = .medium
    
    init(id: String, title: String, description: String, parentListId: String) {
        self.id = id
        self.title = title
        self.description = description
        self.dateCreated = Date()
        self.parentListId = parentListId
    }
}

// MARK: - Hashable

extension Task: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + id + parentListId)
    }
    
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.title == rhs.title && lhs.id == rhs.id
    }
}
