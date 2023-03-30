//
//  ViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/09.
//

import UIKit


class LoginViewController: UIViewController {
    
    var isPushedResistration = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTappedUnregisteredButton(_ sender: Any) {
//        if isPushedResistration {
//            self.navigationController?.popViewController(animated: true)
//        } else {
//            let vc = UIStoryboard(name: "RegistrationName", bundle: nil).instantiateViewController(withIdentifier: "RegistrationName") as! RegistrationNameViewController
//            vc.isPushedLogin = true
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        let vc = UIStoryboard(name: "RegistrationName", bundle: nil).instantiateViewController(withIdentifier: "RegistrationName") as! RegistrationNameViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

