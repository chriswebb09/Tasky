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
    
    init(id: String, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
        self.dateCreated = Date()
    }
}
