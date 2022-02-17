//
//  UITabBar+Extension.swift
//  Tasky
//
//  Created by Christopher Webb on 2/13/22.
//

import UIKit

extension UITabBar {
    
    func createLayer2(rect: CGRect) {
        let styledLayer = CAShapeLayer()
        let size = CGSize(width: 30, height: 100)
        let corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
        let bezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: size)
       // let shadowrect = CGRect(x: rect.minX + 3, y: rect.minY + 4, width: rect.width, height: rect.height)
        //let shadowBezierPath = UIBezierPath(roundedRect: shadowrect, byRoundingCorners: corners, cornerRadii: size)
        styledLayer.path = bezierPath.cgPath
//        if traitCollection.userInterfaceStyle != .dark {
//            styledLayer.shadowColor = UIColor.black.cgColor
//            styledLayer.shadowPath = shadowBezierPath.cgPath
//            styledLayer.shadowRadius = 3
//            styledLayer.shadowOpacity = 0.5
//            styledLayer.opacity = 1.0
//        }
        styledLayer.masksToBounds = false
        styledLayer.fillColor = UIColor.white.cgColor
        //UIColor.customGray.cgColor
        styledLayer.shouldRasterize = true
        styledLayer.rasterizationScale = UIScreen.main.scale
        layer.insertSublayer(styledLayer, at: 0)
    }
    
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
        styledLayer.fillColor = UIColor.white.cgColor
        //UIColor.customGray.cgColor
        styledLayer.shouldRasterize = true
        styledLayer.rasterizationScale = UIScreen.main.scale
        layer.insertSublayer(styledLayer, at: 0)
    }
}
