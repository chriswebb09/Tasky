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
    var priority: Priority = .medium
    
    // MARK: - Initialize
    
    init(name: String, tasks: [Task], dateCreated: Date, id: String, lastUpdated: Date) {
        self.name = name
        self.tasks = tasks
        self.dateCreated = dateCreated
        self.id = id
        self.lastUpdated = lastUpdated
        self.favorited = false
    }
    
    static let lists: [List] = [
        List(name: "Test1", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test2", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test3", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test4", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test5", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test6", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test7", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test8", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test9", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test10", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test11", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test12", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date()),
        List(name: "Test13", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date())
    ]
}

// MARK: - Hashable

extension List: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name + id)
    }
    
    static func == (lhs: List, rhs: List) -> Bool {
        return lhs.name == rhs.name && lhs.id == rhs.id
    }
}

