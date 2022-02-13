//
//  UITabBar+Extension.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

extension UIColor {
    static let offWhite = UIColor.init(red: 225/255, green: 225/255, blue: 235/255, alpha: 1)
    static let customGray = UIColor(red: 0.28, green: 0.28, blue: 0.29, alpha: 1.00)
}

extension UITabBar {
    func createLayer(rect: CGRect) {
        let styledLayer = CAShapeLayer()
        let size = CGSize(width: 20, height: 100)
        let corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: size)
        let shadowrect = CGRect(x: rect.minX + 3, y: rect.minY + 4, width: rect.width, height: rect.height)
        let shadowBezierPath = UIBezierPath(roundedRect: shadowrect, byRoundingCorners: corners, cornerRadii: size)
        styledLayer.path = bezierPath.cgPath
        if traitCollection.userInterfaceStyle != .dark {
            styledLayer.shadowColor = UIColor.black.cgColor
            styledLayer.shadowPath = shadowBezierPath.cgPath
            styledLayer.shadowRadius = 3
            styledLayer.shadowOpacity = 0.35
            styledLayer.opacity = 1.0
        }
        styledLayer.masksToBounds = false
        styledLayer.fillColor = UIColor.customGray.cgColor
        styledLayer.shouldRasterize = true
        styledLayer.rasterizationScale = UIScreen.main.scale
        layer.insertSublayer(styledLayer, at: 0)
    }
}
