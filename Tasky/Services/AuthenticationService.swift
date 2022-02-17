//
//  AuthenticationService.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import Firebase
import FirebaseAuth
import Foundation
import UIKit

struct AuthenticationService {
    
   static func signIn(email: String, password: String, completion: @escaping (AuthDataResult?) -> Void)  {
       let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
       let viewController = windowScene?.windows.filter { $0.isKeyWindow }.first!.rootViewController
       
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                Toast.show(message: error?.localizedDescription ?? "", controller: viewController!)
            } else {
                DispatchQueue.main.async {
                    completion(authResult)
                }
            }
        }
    }
    
    
    static func createAccount(email: String, password: String, completion: @escaping (AuthDataResult?) -> Void) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let viewController = windowScene?.windows.filter { $0.isKeyWindow }.first!.rootViewController
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                Toast.show(message: error?.localizedDescription ?? "", controller: viewController!)
            } else {
                let passwordData = Data(password.utf8)
                KeychainHelper.standard.save(passwordData, service: "password", account: "account")
                
                let emailData = Data(email.utf8)
                KeychainHelper.standard.save(emailData, service: "email", account: "account")
               
                completion(authResult)
            }
        }
    }
}


