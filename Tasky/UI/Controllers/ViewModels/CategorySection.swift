//
//  CategorySection.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

class TasksDueSection: Hashable {
    
    var sectionTitle: String = "Tasks Due Soon"
    
    var tasks: [Task]?
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: TasksDueSection, rhs: TasksDueSection) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
}
