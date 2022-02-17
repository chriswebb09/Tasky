//
//  SplashView.swift
//  Tasky
//
//  Created by Christopher Webb on 2/17/22.
//

import SwiftUI

struct SplashView: View {
    
    @State private var rotationAngle = 0.0
    var configuration: Configuration
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.cyan, newColor]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                Image("app-icon2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
                    .rotation3DEffect(
                        Angle(degrees: self.rotationAngle),
                        axis: (x: 0.0, y: 0.0, z: 2.0)
                    )
                    .animation(.easeIn(duration: 0.8), value: rotationAngle)
            ).onAppear {
                self.rotationAngle += 360
                finish()
            }
    }
    
    func finish() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.configuration.delegate?.splashComplete()
        }
    }
}

extension SplashView {
    final class Configuration {
        unowned var delegate: SplashViewDelegate?
    }
}
