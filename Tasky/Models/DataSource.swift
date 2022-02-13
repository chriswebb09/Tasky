//
//  DataSource.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

struct DataSource<T: Hashable> {
    let sections: [T]
}
