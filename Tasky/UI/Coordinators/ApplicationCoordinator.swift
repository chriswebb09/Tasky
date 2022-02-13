//
//  ApplicationCoordinator.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    var window: UIWindow
    var rootController: UIViewController!
    
    init(window: UIWindow) {
        self.window = window
        self.rootController = SplashViewConroller()
    }
    
    func start() {
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
}
