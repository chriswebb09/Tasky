//
//  List.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

struct List {
    var name: String
    var tasks: [Task]
    var dateCreated: Date
    var id: String
    var lastUpdated: Date
    var favorited: Bool
    
    init(name: String, tasks: [Task], dateCreated: Date, id: String, lastUpdated: Date) {
        self.name = name
        self.tasks = tasks
        self.dateCreated = dateCreated
        self.id = id
        self.lastUpdated = lastUpdated
        self.favorited = false
    }
    
}

// MARK: - Hashable

extension List: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.name == rhs.name
    }
}

