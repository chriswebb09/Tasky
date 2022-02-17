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
    var tag: TaskTag
    var priorty: Priority = .medium
    
    private enum CodingKeys: String, CodingKey {
        case title
        case id
        case description
        case dateCreated
        case parentListId
        case priority
        case tag
    }
    
    init(id: String, title: String, description: String, parentListId: String, tag: TaskTag) {
        self.id = id
        self.title = title
        self.description = description
        self.dateCreated = Date()
        self.parentListId = parentListId
        self.tag = tag
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decode(String.self, forKey: .description)
        self.dateCreated = try values.decode(Date.self, forKey: .dateCreated)
        self.parentListId = try values.decode(String.self, forKey: .parentListId)
        self.tag = try values.decode(TaskTag.self, forKey: .tag)
    }
    
    func encode(to encoder: Encoder) throws { }
    
    
    static let tasks: [Task] = [
        Task(id: UUID().uuidString, title: "Task 1", description: "This is a task", parentListId: List.lists[0].id, tag: TaskTag(subject: "Work", id: UUID().uuidString)),
        Task(id: UUID().uuidString, title: "Task 2", description: "This is another task", parentListId: List.lists[0].id, tag: TaskTag(subject: "Work", id: UUID().uuidString))
    ]
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
