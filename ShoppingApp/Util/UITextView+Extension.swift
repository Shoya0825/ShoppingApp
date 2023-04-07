//
//  UITextView+Extension.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/03.
//

import UIKit

@IBDesignable class DesignableTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setDonebutton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDonebutton()
    }
    
    private func setDonebutton() {
        let toolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
        
        let doneButton = UIBarButtonItem(title: "完了",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTappedDoneButton))
        toolbar.items = [space, doneButton]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    
    @objc func didTappedDoneButton() {
        self.resignFirstResponder()
    }
}

extension UITextView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                self.layer.borderColor = color.cgColor
            } else {
                self.layer.borderColor = nil
            }
        }
    }
    
}
