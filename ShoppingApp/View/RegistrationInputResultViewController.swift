//
//  RegistrationInputResultViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/28.
//

import UIKit
import RealmSwift

class RegistrationInputResultViewController: UIViewController {
    
    
    @IBOutlet weak var kanjiLastNameLabel: UILabel!
    @IBOutlet weak var kanjiFirstNameLabel: UILabel!
    @IBOutlet weak var kanaLastNameLabel: UILabel!
    @IBOutlet weak var kanaFirstNameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var kanjiNameView: UIStackView!
    @IBOutlet weak var kanaNameView: UIStackView!
    @IBOutlet weak var birthdayView: DesignableView!
    @IBOutlet weak var addressView: DesignableView!
    @IBOutlet weak var emailView: DesignableView!
    @IBOutlet weak var passwordView: DesignableView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUserData()
    }
    
    
    func setupUserData() {
        kanjiLastNameLabel.text = UserData.shared.kanjiLastName
        kanjiFirstNameLabel.text = UserData.shared.kanjiFirstName
        kanaLastNameLabel.text = UserData.shared.kanaLastName
        kanaFirstNameLabel.text = UserData.shared.kanjiFirstName
        
        if let address1 = UserData.shared.prefecture, let address2 = UserData.shared.address {
            addressLabel.text = address1 + address2
        }
        
        emailLabel.text = UserData.shared.email
        passwordLabel.text = UserData.shared.password
    }
    
    
    @IBAction func didTappedUserNameChangeButton(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationName", bundle: nil).instantiateViewController(withIdentifier: "RegistrationName") as! RegistrationNameViewController
        
        vc.isChanged = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTappedBirthdayChangeButton(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationBirthday", bundle: nil).instantiateViewController(withIdentifier: "RegistrationBirthday") as! RegistrationBirthdayViewController
        
        vc.isChanged = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTappedAddressChangeButton(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationAddress", bundle: nil).instantiateViewController(withIdentifier: "RegistrationAddress") as! RegistrationAddressViewController
        
        vc.isChanged = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTappedEmailOrPasswordChangeButton(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationEmailAndPassword", bundle: nil).instantiateViewController(withIdentifier: "RegistrationEmailAndPassword") as! RegistrationEmailAndPasswordViewController
        
        vc.isChanged = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTappedRegistrationButton(_ sender: Any) {
        
        try! realm.write {
            realm.add(UserData.shared)
        }
        
        print(realm.objects(UserData.self))
        
    }
    
}
