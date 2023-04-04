//
//  ItemMainInfoCell.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/03.
//

import UIKit

class ItemMainInfoCell: UITableViewCell, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var itemNameTextField: DesignableTextFiled!
    @IBOutlet weak var itemInfoTextView: DesignableTextView!
    
    @IBOutlet weak var itemNameCountLabel: UILabel!
    @IBOutlet weak var itemInfoCountLabel: UILabel!
    
//    let placeHolder = "色、素材、重さ、定価、注意点など\n例)2010年頃に1万円で購入したジャケットです。\nライトグレーで傷はありません。あわせやすいので\nおすすめです。\n\n＃ジャケット＃ジャケットコーデ"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemNameTextField.delegate = self
        itemInfoTextView.delegate = self
        
//        if itemInfoTextView.text.isEmpty {
//            itemInfoTextView.text = placeHolder
//            itemInfoTextView.textColor = UIColor.systemGray3
//        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let currentText = textField.text {
            
            guard let stringRnage = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRnage, with: string)
            itemNameCountLabel.text = "\(updatedText.count)／40"
            
            return updatedText.count <= 40
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            textView.text = placeHolder
//            textView.textColor = UIColor.systemGray3
//        }
        itemInfoCountLabel.text = "\(textView.text.count)／1000"
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return currentText.count <= 1000
    }
}
