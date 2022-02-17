//
//  UITextField+Extension.swift
//  Tasky
//
//  Created by Christopher Webb on 2/16/22.
//

import UIKit

extension UITextField {
    
    func addUnderLine () {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height-10, width: self.frame.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }
    
}
