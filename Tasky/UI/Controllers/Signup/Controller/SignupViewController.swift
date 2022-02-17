//
//  SignupViewController.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import UIKit


class SignUpViewController: UIViewController {
    
    weak var delegate: SignUpViewControllerDelegate?
    private var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = SignupView.Configuration()
        configuration.delegate = self
        let signup = SignupView(configuration: configuration).ignoresSafeArea(.keyboard, edges: .bottom)
        addSubSwiftUIView(signup, to: self.view)
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
        self.delegate?.signupViewControllerDismissed()
        self.dismiss(animated: true, completion: nil)
    }
}

extension SignUpViewController: SignupViewDelegate {
    func signupTapped(email: String, password: String) {
        delegate?.signupTapped(email: email, password: password)
    }
}
