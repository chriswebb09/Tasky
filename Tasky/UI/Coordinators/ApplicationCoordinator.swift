//
//  ApplicationCoordinator.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit
import Firebase

class ApplicationCoordinator: Coordinator {
    
    var window: UIWindow
    var rootController: UIViewController!
    
    private var button: UIButton!
    private let homeVC = HomeViewController.getHomeVC()
    private let listVC = ListsViewController.getListVC()
    private let settingsVC = SettingsViewController.getSettingsVC()
    private let statsVC = TasksViewController.getTaskVC()
    
    private let loginVC: LoginViewController! = LoginViewController()
    private let signupVC: SignUpViewController! = SignUpViewController()
    private let splashVC = SplashViewConroller()
    private let welcomeVC = WelcomeViewController()
    
    
    init(window: UIWindow) {
        self.window = window
        splashVC.delegate = self
        rootController = splashVC
    }
    
    func start() {
        window.rootViewController = rootController
        window.makeKeyAndVisible()
    }
    
    func floatingButton() {
        var configuration = UIButton.Configuration.filled()
        let config = UIImage.SymbolConfiguration(
            pointSize: 28, weight: .regular, scale: .default)
        let image = UIImage(systemName: AppConstants.ImageAssets.plus, withConfiguration: config)
        configuration.image = image
        button = UIButton(configuration: configuration, primaryAction: nil)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 35
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 1, height: 4.9)
        button.layer.shadowRadius = 6
        button.addTarget(self, action: #selector(newTask), for: .touchUpInside)
        let backgroundView = UIView(frame: CGRect(x: 285, y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height * 0.14), width: 100, height: 100))
        backgroundView.backgroundColor = .clear
        backgroundView.addSubview(button)
        window.addSubview(backgroundView)
    }
}

extension ApplicationCoordinator {
    
    func setTabbar() {
        rootController = UINavigationController(rootViewController: homeVC)
        window.rootViewController = self.rootController
        UIView.transition(with: window, duration: 0.25, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
        self.floatingButton()
    }
    
    @objc func newTask() {
        self.rootController.present(NewListViewController.getNewListVC(), animated: true, completion: nil)
    }
}

extension ApplicationCoordinator: SplashViewConrollerDelegate {
    func splashComplete() {
        if let email = KeychainHelper.standard.read(service: "email", account: "account"),
           let password = KeychainHelper.standard.read(service: "password", account: "account") {
            let passwordToken = String(data: password, encoding: .utf8)!.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            let emailToken = String(data: email, encoding: .utf8)!.trimmingCharacters(in: .newlines).trimmingCharacters(in: .whitespaces)
            AuthenticationService.signIn(email: emailToken, password: passwordToken) { authData in
                DispatchQueue.main.async {
                    self.setTabbar()
                }
            }
        } else {
            welcomeVC.delegate = self
            signupVC.delegate = self
            loginVC.delegate = self
            rootController = self.welcomeVC
            DispatchQueue.main.async {
                self.window.rootViewController = self.rootController
                UIView.transition(with: self.window, duration: 0.25, options: [.transitionCrossDissolve], animations: nil, completion: nil)
            }
        }
    }
}

extension ApplicationCoordinator: WelcomeViewControllerDelegate {
    func signupTapped() {
        DispatchQueue.main.async {
            let view = UIView(frame: self.welcomeVC.view.frame)
            view.backgroundColor = .white
            self.welcomeVC.view.addSubview(view)
            self.welcomeVC.view.bringSubviewToFront(view)
            self.signupVC.isModalInPresentation = true
            self.rootController.present(self.signupVC, animated: true, completion: nil)
        }
    }
    
    func loginTapped() {
        DispatchQueue.main.async {
            let view = UIView(frame: self.welcomeVC.view.frame)
            view.backgroundColor = .white
            self.welcomeVC.view.addSubview(view)
            self.welcomeVC.view.bringSubviewToFront(view)
            self.loginVC.isModalInPresentation = true
            self.rootController.present(self.loginVC, animated: true, completion: nil)
        }
    }
}


extension ApplicationCoordinator: LoginViewControllerDelegate {
    func loginTapped(email: String, password: String) {
        AuthenticationService.signIn(email: email, password: password) { authData in
            DispatchQueue.main.async {
                let navVC = UINavigationController(rootViewController: self.homeVC)
                self.rootController = self.homeVC
                self.window.rootViewController = self.rootController
                UIView.transition(with: self.window, duration: 0.25, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
                self.floatingButton()
            }
        }
    }
    
    func signupViewControllerDismissed() {
        DispatchQueue.main.async {
            print(self.welcomeVC.view.subviews)
            self.welcomeVC.view.subviews.last?.removeFromSuperview()
        }
    }
}


extension ApplicationCoordinator: SignUpViewControllerDelegate {
    func signupTapped(email: String, password: String) {
        AuthenticationService.createAccount(email: email, password: password) { authData in
            self.rootController = TabBarViewController.makeTabbar(viewControllers: [self.homeVC, self.listVC, self.statsVC, self.settingsVC])
            self.window.rootViewController = self.rootController
            // add animation
            UIView.transition(with: self.window, duration: 0.25, options: [.transitionFlipFromLeft], animations: nil, completion: nil)
            self.floatingButton()
        }
    }
    
    func loginViewControllerDismissed() {
        DispatchQueue.main.async {
            print(self.welcomeVC.view.subviews)
            self.welcomeVC.view.subviews.last?.removeFromSuperview()
        }
    }
}
