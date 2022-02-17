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
    var tag: ListTag
    var priority: Priority = .medium
    
    // MARK: - Initialize
    
    init(name: String, tasks: [Task], dateCreated: Date, id: String, lastUpdated: Date, tag: ListTag) {
        self.name = name
        self.tasks = tasks
        self.dateCreated = dateCreated
        self.id = id
        self.lastUpdated = lastUpdated
        self.favorited = false
        self.tag = tag
    }
    
    static let lists: [List] = [
        List(name: "Test1", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date(), tag: ListTag(subject: "tag 1", id: UUID().uuidString)),
        List(name: "Test2", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date(), tag: ListTag(subject: "tag 5", id: UUID().uuidString))
    ]
    
    static let list2: [List] = [
        List(name: "Test3", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date(), tag: ListTag(subject: "tag 2", id: UUID().uuidString)),
        List(name: "Test4", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date(), tag: ListTag(subject: "tag 2", id: UUID().uuidString)),
        List(name: "Test5", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date(), tag: ListTag(subject: "tag 2", id: UUID().uuidString)),
        List(name: "Test6", tasks: [], dateCreated: Date(), id: UUID().uuidString, lastUpdated: Date(), tag: ListTag(subject: "tag 3", id: UUID().uuidString))
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

