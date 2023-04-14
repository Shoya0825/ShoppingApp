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
    
    func showCameraPermissionAlert() {
        let alert = UIAlertController(title: "カメラまたは写真へのアクセス権限がありません\n設定から変更してください", message: "", preferredStyle: UIAlertController.Style.alert)
        
        guard let settingURL = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settingURL) else { return }
        
        
        let okAction = UIAlertAction(title: "設定を開く", style: UIAlertAction.Style.default) {_ in
            UIApplication.shared.open(settingURL)
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window {
                window.rootViewController?.present(alert, animated: true)
            }
        } else {
            UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}
