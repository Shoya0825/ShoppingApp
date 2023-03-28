//
//  UIView+Extension.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/17.
//

import Foundation
import UIKit

@IBDesignable class DesignableView: UIView {
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
}
