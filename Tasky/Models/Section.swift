//
//  Section.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation

struct Section<T: Hashable, U: Hashable>: Hashable {
    let headerItem: T
    let sectionItems: U
}
