//
//  H2TextView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import SwiftUI

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
