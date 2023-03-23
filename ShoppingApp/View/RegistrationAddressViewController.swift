//
//  RegistrationAddressViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/10.
//

import UIKit
import Alamofire
import SVProgressHUD

class RegistrationAddressViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var prefectureLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    var activeTextField: UITextField?
    
    let addressRequest = AddressRequest()
    var addresses: AddressModel?
    let alert = AlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zipCodeTextField.delegate = self
        addressTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeTextField = textField == addressTextField ? textField : nil
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == zipCodeTextField {
            
            if textField.text?.count != 7 {
                alert.showAlert(vc: self, title: "エラー", message: "郵便番号は7桁で入力してください")
                return
            }
            
            searchZipCode()
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == zipCodeTextField {
            
            guard let zipCode = textField.text else { return }
            
            if zipCode.count > 7 {
                textField.text = String(zipCode.prefix(7))
            }
        }
    }
    
    @objc func keyboardWillShown(notification: NSNotification) {
        if let userInfo = notification.userInfo, let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            
            if activeTextField == addressTextField {
                let distance = (keyboardFrame.minY - okButton.frame.maxY) - 20
                
                if self.view.frame.origin.y == 0 {
                    UIView.animate(withDuration: 0.1, animations: {
                        self.view.frame.origin.y -= distance
                    })
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
    
    func searchZipCode() {
        SVProgressHUD.show()
        
        addressRequest.requestAddress(zipCode: zipCodeTextField.text!) { data, result, error in
            SVProgressHUD.dismiss()
            
            if result {
                
                guard let addresses = data?.results[0] else {
                    self.addressTextField.text = ""
                    self.alert.showAlert(vc: self, title: "エラー", message: "住所が見つかりませんでした")
        
                    return
                }
                
                let prefecture = addresses.address1
                let city = addresses.address2
                let town = addresses.address3
                
                self.prefectureLabel.text = prefecture
                self.addressTextField.text = city + town
                
            } else {
                self.alert.showAlert(vc: self, title: "エラー", message: "郵便番号を再度入力してください")
            }
        }
    }
    
    @IBAction func didTappedOKButton(_ sender: Any) {
    }
    
}
