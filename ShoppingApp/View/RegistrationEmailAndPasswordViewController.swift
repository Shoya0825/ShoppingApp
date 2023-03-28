//
//  RegistrationEmailAndPasswordViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/24.
//

import UIKit

class RegistrationEmailAndPasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var confirmPasswordErrorLabel: UILabel!
    
    
    var activeTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        
        if emailTextField.text == "" || passwordTextField.text == "" || confirmTextField.text == "" {
            okButton.isEnabled = false
            okButton.configuration?.background.backgroundColor = UIColor.systemGray3
        } else {
            okButton.isEnabled = true
            okButton.configuration?.background.backgroundColor = UIColor.white
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if activeTextField == emailTextField {
            if let text = emailTextField.text {
                let message = Validator.shared.emailValidationCheck(email: text)
                emailErrorLabel.isHidden = message == ""
                emailErrorLabel.text = message
            }
        }
        
        if activeTextField == passwordTextField {
            if let text = passwordTextField.text {
                let message = Validator.shared.passwordValidationCheck(password: text)
                passwordErrorLabel.isHidden = message == ""
                passwordErrorLabel.text = message
            }
        }
        
        if activeTextField == confirmTextField {
            if let password = passwordTextField.text, let confirmPassword = confirmTextField.text {
                let message = Validator.shared.confirmPasswordValidationCheck(password: password, confirmPassword: confirmPassword)
                confirmPasswordErrorLabel.isHidden = message == ""
                confirmPasswordErrorLabel.text = message
            }
        }
        
        if emailErrorLabel.isHidden && passwordErrorLabel.isHidden && confirmPasswordErrorLabel.isHidden {
            okButton.isEnabled = true
            okButton.configuration?.background.backgroundColor = UIColor.white
        } else {
            okButton.isEnabled = false
            okButton.configuration?.background.backgroundColor = UIColor.systemGray3
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if activeTextField == confirmTextField {
            if passwordTextField.text == "" {
                confirmPasswordErrorLabel.text = "パスワードを先に入力してください"
                confirmPasswordErrorLabel.isHidden = false
                return false
            }
            return string.range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
        }
        return true
    }
    
    
    
    
    func checkConfirmPassword() {
        if let passwordText = passwordTextField.text {
            if confirmTextField.text == passwordText {
                confirmPasswordErrorLabel.isHidden = true
                
            } else {
                confirmPasswordErrorLabel.text = "パスワードが一致していません"
                confirmPasswordErrorLabel.isHidden = false
            }
            
        }
    }
    
    
    @objc func keyboardWillShown(notification: NSNotification) {
        if let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            
            if activeTextField == passwordTextField || activeTextField == confirmTextField {
                
                if let confirmTextFieldFrame = confirmTextField.superview?.convert(confirmTextField.frame, to: view) {
                    
                    let distance = (keyboardFrame.minY - confirmTextFieldFrame.maxY) - 30
                    
                    if self.view.frame.origin.y == 0 {
                        UIView.animate(withDuration: 0.1, animations: {
                            self.view.frame.origin.y += distance
                        })
                    }
                }
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
        if let text = emailTextField.text {
            
            let message = Validator.shared.emailFormatCheck(email: text)
            emailErrorLabel.isHidden = message == ""
            emailErrorLabel.text = message
            return
        }
        
        
    }
    
}
