//
//  Coordinator.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var window: UIWindow { get }
    var rootController: UIViewController! { get }
    func start()
}
