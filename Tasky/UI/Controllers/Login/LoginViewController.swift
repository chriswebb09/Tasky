//
//  LoginViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = LoginView.Configuration()
        configuration.delegate = self
        let login = LoginView(configuration: configuration)
        addSubSwiftUIView(login, to: self.view)
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func loginTapped(email: String, password: String) {
        delegate?.loginTapped(email: email, password: password)
    }
}
