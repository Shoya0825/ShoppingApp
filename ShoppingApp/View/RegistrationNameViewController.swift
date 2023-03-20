//
//  RegistrationNameViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/09.
//

import UIKit

class RegistrationNameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var kanjiLastName: UITextField!
    @IBOutlet weak var kanjiFirstName: UITextField!
    @IBOutlet weak var kanaLastName: UITextField!
    @IBOutlet weak var kanaFirstName: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    
    var isPushedLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        kanjiLastName.delegate = self
        kanjiFirstName.delegate = self
        kanaLastName.delegate = self
        kanaFirstName.delegate = self
        
        isEmptyCheck()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return string.range(of: "[^ぁ-んーァ-ンヴー一-龠]", options: .regularExpression) == nil
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        isEmptyCheck()
    }
    
    func isEmptyCheck() {
        if kanjiLastName.text == "" || kanjiFirstName.text == "" || kanaLastName.text == "" || kanaFirstName.text == "" {
            okButton.isEnabled = false
            okButton.configuration?.background.backgroundColor = UIColor.systemGray3
        } else {
            okButton.isEnabled = true
            okButton.configuration?.background.backgroundColor = UIColor.white
        }
    }
    
    @objc func keyboardWillShown(notification: NSNotification) {
        if let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            
            let distance = (keyboardFrame.minY - okButton.frame.maxY) + 20
            
            if self.view.frame.origin.y == 0 {
                UIView.animate(withDuration: 0.1, animations: {
                    self.view.frame.origin.y -= distance
                })
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            UIView.animate(withDuration: 0.1, animations: {
                self.view.frame.origin.y = 0
            })
        }
    }
    
    
    @IBAction func didTappedOKButton(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationAddress", bundle: nil).instantiateViewController(withIdentifier: "RegistrationAddress") as! RegistrationAddressViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

