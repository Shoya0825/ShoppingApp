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
        guard let currentText = textField.text else { return false }
        
        
        
        return true
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
