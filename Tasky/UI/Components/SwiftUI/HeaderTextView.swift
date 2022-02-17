//
//  WelcomeText.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import SwiftUI

struct HeaderText : View {
    var headerText: String
    var body: some View {
        Text(headerText)
            .font(.largeTitle)
            .fontWeight(.semibold)
    }
}


