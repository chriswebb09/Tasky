//
//  LoginView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import Foundation
import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let newColor = Color.init(uiColor: UIColor(red: 0.30, green: 0.24, blue: 0.54, alpha: 1.00))

struct LoginView : View {
    @State var email: String = ""
    @State var password: String = ""
    var configuration: Configuration
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    HeaderText(headerText: "Sign In")
                        .background(.white)
                        .padding(.bottom, 5)
                    SubheaderText(subheaderText: "Sign in to continue")
                }
                .offset(y: -70)
                VStack {
                    CustomTextField(placeHolder: "Email", value: $email, lineColor: .gray, width: 2)
                        .padding(.bottom, 50)
                    CustomSecureTextField(placeHolder: "Password", value: $password, lineColor: .gray, width: 2)
                }.ignoresSafeArea(.keyboard, edges: .bottom)
                .offset(y: -50)
            }
            .offset(y: -70)
            
            VStack {
                Button(action: {
                    configuration.delegate?.loginTapped(email: email, password: password)
                }) {
                    LoginButtonContent(text: "SIGN IN")
                }
            }.offset(y: -10)
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

extension LoginView {
    final class Configuration {
        unowned var delegate: LoginViewDelegate?
    }
}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView(configuration: LoginView.Configuration())
    }
}
#endif


struct CustomTextField: View {
    var placeHolder: String
    @Binding var value: String
    
    var lineColor: Color
    var width: CGFloat
    
    var body: some View {
        VStack {
            
            TextField(self.placeHolder, text: $value)
                .font(.title3)
            
            Rectangle()
                .frame(height: self.width)
                .foregroundColor(self.lineColor)
        }
    }
}

struct CustomSecureTextField: View {
    var placeHolder: String
    @Binding var value: String
    
    var lineColor: Color
    var width: CGFloat
    
    var body: some View {
        VStack {
            
            SecureField(self.placeHolder, text: $value)
                .font(.title3)
            
            Rectangle()
                .frame(height: self.width)
                .foregroundColor(self.lineColor)
        }
    }
}


//SecureField("Password", text: $password)
//    .padding()
//    .background(lightGreyColor)
//    .cornerRadius(5.0)
//    .padding(.bottom, 20)
