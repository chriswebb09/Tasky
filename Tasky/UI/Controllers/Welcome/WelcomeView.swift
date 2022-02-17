//
//  WelcomeView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import SwiftUI

struct WelcomeView : View {
    var configuration: Configuration
    
    var body: some View {
       
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading) {
                    HeaderText(headerText: "Welcome to Tasky")
                        .padding(.bottom, 8)
                    H2Text(subheaderText: "It's the task-centric app")
                }
                .offset(y: -90)
            }
            .offset(y: -60)
            VStack {
                Button(action: {
                    configuration.delegate?.loginTapped()
                }) {
                    LoginButtonContent(text: "Log In")
                }.padding(.bottom, 30)
                
                Button(action: {
                    configuration.delegate?.signupTapped()
                }) {
                    LoginButtonContent(text: "Sign Up")
                }.padding(.bottom, 20)
            }
            
            
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

extension WelcomeView {
    final class Configuration {
        unowned var delegate: WelcomeViewDelegate?
    }
}

#if DEBUG
struct WelcomeView_Previews : PreviewProvider {
    static var previews: some View {
        WelcomeView(configuration: WelcomeView.Configuration())
    }
}
#endif

