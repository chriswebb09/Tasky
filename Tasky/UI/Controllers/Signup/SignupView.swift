//
//  SignupView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import Foundation
import SwiftUI

struct SignupView : View {
    @State var email: String = ""
    @State var password: String = ""
    var configuration: Configuration
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    HeaderText(headerText: "Sign Up")
                        .padding(.bottom, 5)
                    SubheaderText(subheaderText: "Create your new account.")
                }
                .offset(y: -60)
                VStack {
                    CustomTextField(placeHolder: "Email", value: $email, lineColor: .gray, width: 2)
                        .padding(.bottom, 40)
                    CustomSecureTextField(placeHolder: "Password", value: $password, lineColor: .gray, width: 2)
                }
                .offset(y: -50)
            }
            .offset(y: -60)
            
            VStack {
                Button(action: {
                    configuration.delegate?.signupTapped(email: email, password: password)
                }) {
                    LoginButtonContent(text: "SIGN UP")
                }
            }.offset(y: -20)
            
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

extension SignupView {
    final class Configuration {
        unowned var delegate: SignupViewDelegate?
    }
}

#if DEBUG
struct SignupView_Previews : PreviewProvider {
    static var previews: some View {
        SignupView(configuration: SignupView.Configuration())
    }
}
#endif
