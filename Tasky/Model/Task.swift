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
    
    private enum CodingKeys: String, CodingKey {
        case title
        case id
        case description
        case dateCreated
        case parentListId
        case priority
    }
    
    init(id: String, title: String, description: String, parentListId: String) {
        self.id = id
        self.title = title
        self.description = description
        self.dateCreated = Date()
        self.parentListId = parentListId
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decode(String.self, forKey: .description)
        self.dateCreated = try values.decode(Date.self, forKey: .dateCreated)
        self.parentListId = try values.decode(String.self, forKey: .parentListId)
    }
    
    func encode(to encoder: Encoder) throws {
        
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
