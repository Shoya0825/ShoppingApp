//
//  UIView+Extension.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/17.
//

import Foundation
import UIKit

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }

    @IBInspectable var cornerRadiusTopLeft: CGFloat = 0.0 {
        didSet {
            layer.maskedCorners = [.layerMinXMinYCorner]
            layer.cornerRadius = cornerRadiusTopLeft
        }
    }
    
}

