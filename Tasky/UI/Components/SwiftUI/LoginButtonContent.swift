//
//  LoginButtonContent.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import SwiftUI

struct LoginButtonContent : View {
    var text: String
    var body: some View {
        return Text(text)
            .font(.system(size: 24, weight: .regular, design: .serif))
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 60)
            .background(Color.init(uiColor: UIColor.primaryColor))
            .cornerRadius(20)
    }
    
}


struct SignUpButtonContent : View {
    var text: String
    var body: some View {
        return Text(text)
            .underline()
            .font(.system(size: 20, weight: .bold, design: .serif))
            .padding()
    }
}


