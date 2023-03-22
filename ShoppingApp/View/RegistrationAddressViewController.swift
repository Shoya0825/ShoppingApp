//
//  RegistrationAddressViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/10.
//

import UIKit
import Alamofire

class RegistrationAddressViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var prefectureLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var okButton: UIButton!
    var activeTextField: UITextField?
    
    let addressRequest = AddressRequest()
    private var addresses: AddressModel?
    
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
    
    @IBAction func didTappedOKButton(_ sender: Any) {
        addressRequest.requestAddress(zipCode: zipCodeTextField.text!) { result, error in

        }
    }
    
}
