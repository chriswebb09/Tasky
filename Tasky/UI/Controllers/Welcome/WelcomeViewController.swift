//
//  WelcomeViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import UIKit



class WelcomeViewController: UIViewController {
    
    weak var delegate: WelcomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = WelcomeView.Configuration()
        configuration.delegate = self
        let welcome = WelcomeView(configuration: configuration)
        addSubSwiftUIView(welcome, to: self.view)
    }
}

extension WelcomeViewController: WelcomeViewDelegate {
    func signupTapped() {
        delegate?.signupTapped()
    }
    
    func loginTapped() {
        delegate?.loginTapped()
    }
}
