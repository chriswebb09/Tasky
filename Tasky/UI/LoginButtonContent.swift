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
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 60)
            .background(Color.init(uiColor: UIColor.primaryColor))
            .cornerRadius(15.0)
    }
}

