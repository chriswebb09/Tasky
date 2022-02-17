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

struct H2Text : View {
    var subheaderText: String
    var body: some View {
        return Text(subheaderText)
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(Color(UIColor.lightGray))
            .padding(.bottom, 40)
    }
}

struct SubheaderText : View {
    var subheaderText: String
    var body: some View {
        return Text(subheaderText)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color(UIColor.lightGray))
            .padding(.bottom, 40)
    }
}
