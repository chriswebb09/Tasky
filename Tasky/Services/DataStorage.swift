//
//  DataStorage.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

// MARK: - LocalServices

struct DataStorage {
    
    static func readFile() -> [Task]? {
        var json: [Task]? = nil
        do {
            let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(AppConstants.Storage.tasksPath)
            let data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
            json = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            Logger.log(error.localizedDescription)
        }
        return json
    }
    
    static func saveToFile(tasks: [Task]) {
        do {
            let fileURL = try FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent(AppConstants.Storage.tasksPath)
            try JSONEncoder().encode(tasks).write(to: fileURL)
        } catch {
            Logger.log(error.localizedDescription)
        }
    }
    
}
