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
    private var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = LoginView.Configuration()
        configuration.delegate = self
        let login = LoginView(configuration: configuration).ignoresSafeArea(.keyboard, edges: .bottom)
        addSubSwiftUIView(login, to: self.view)
        self.view.backgroundColor = .white
        
        
        var buttonConfig = UIButton.Configuration.plain()
        let config = UIImage.SymbolConfiguration(
            pointSize: 24, weight: .regular, scale: .default)
        let image = UIImage(systemName: "xmark", withConfiguration: config)
        buttonConfig.image = image
        button = UIButton(configuration: buttonConfig, primaryAction: nil)
        button.frame = CGRect(x: self.view.frame.width - 80, y: 0, width: 70, height: 70)
        button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    
    @objc func dismissVC() {
        self.delegate?.loginViewControllerDismissed()
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func loginTapped(email: String, password: String) {
        delegate?.loginTapped(email: email, password: password)
    }
}
