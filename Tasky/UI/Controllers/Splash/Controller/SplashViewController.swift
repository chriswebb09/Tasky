//
//  SplashViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit
import SwiftUI

class SplashViewConroller: UIViewController {
    
    weak var delegate: SplashViewConrollerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = SplashView.Configuration()
        configuration.delegate = self
        let view = SplashView(configuration: configuration)
        addSubSwiftUIView(view, to: self.view)
    }
}

extension SplashViewConroller: SplashViewDelegate {
    func splashComplete() {
        delegate?.splashComplete()
    }

}



