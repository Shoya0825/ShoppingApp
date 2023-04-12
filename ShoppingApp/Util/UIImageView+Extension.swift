//
//  UIImageView+Extension.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/10.
//

import UIKit

@IBDesignable class DesignableImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
}
