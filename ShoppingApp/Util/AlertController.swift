//
//  AlertController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/23.
//

import UIKit

class AlertController {
    
    func showAlert(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
}
