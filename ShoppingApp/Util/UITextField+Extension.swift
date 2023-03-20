//
//  UITextField+Extension.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/17.
//

import Foundation
import UIKit

@IBDesignable class DesignableTextFiled: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setPaddingLeft()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setPaddingLeft()
    }
    
    private func setPaddingLeft() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
}

extension UITextField {
    @IBInspectable override var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
}



