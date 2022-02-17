//
//  SubheaderTextView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import SwiftUI

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
