//
//  SignupViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import UIKit


class SignUpViewController: UIViewController {
    weak var delegate: SignUpViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = SignupView.Configuration()
        configuration.delegate = self
        let signup = SignupView(configuration: configuration)
        addSubSwiftUIView(signup, to: self.view)
    }
}

extension SignUpViewController: SignupViewDelegate {
    func signupTapped(email: String, password: String) {
        delegate?.signupTapped(email: email, password: password)
    }
}
