//
//  ItemPriceCell.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/03.
//

import UIKit

class ItemPriceCell: UITableViewCell, UITextFieldDelegate {
    
    
    @IBOutlet weak var itemPriceTextField: DesignableTextFiled!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemPriceTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        guard let selectedRange = textField.selectedTextRange else { return false }
        let cursorPosition = textField.offset(from: textField.beginningOfDocument, to: selectedRange.start)
        
        let firstDigitIsZero = textField.text?.count == 1 && textField.text == "0"
        
        // 1文字目0、右カーソルの場合2文字目問題未解決
        if firstDigitIsZero {
            if cursorPosition == 0 {
                return string != "0"
            } else {
                if string != "0" {
                    textField.text = string
                    return true
                } else {
                    return false
                }
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let priceText = Int(text) {
            textField.text = "\(priceText.formattedWithSeparator)"
        }
    }
    
    private func numberFormatter(text: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        let number = formatter.number(from: text) ?? 0
        
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        let outputString = formatter.string(from: number)
        
        return outputString!
    }
}
