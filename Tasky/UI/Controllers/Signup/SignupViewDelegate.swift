//
//  SignupViewDelegate.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import Foundation

protocol SignupViewDelegate: AnyObject {
    func signupTapped(email: String, password: String)
}
