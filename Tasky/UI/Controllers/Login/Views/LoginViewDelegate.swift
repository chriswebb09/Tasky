//
//  LoginViewDelegate.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import Foundation

protocol LoginViewDelegate: AnyObject {
    func loginTapped(email: String, password: String)
}

