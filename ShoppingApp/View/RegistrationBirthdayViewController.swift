//
//  RegistrationBirthDayViewController.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/23.
//

import UIKit

class RegistrationBirthdayViewController: UIViewController {
    
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var pickerView: UIView!
    
    let birthdate = BirthDateFormatter()
    var isChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale = Locale(identifier: "ja_JP")
        datePicker.timeZone = TimeZone(identifier: "Asia/Tokyo")
        datePicker.calendar = Calendar(identifier: .gregorian)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if isChanged {
            pickerView.isHidden = true
            birthdayLabel.text = UserData.shared.birthday
        }
    }
    
    @IBAction func didTappedSetBirthdayButton(_ sender: Any) {
        pickerView.isHidden = true
        
        birthdate.birtdate = datePicker.date
        birthdayLabel.text = birthdate.birthdateString
    }
    
    @IBAction func didTappedBirthdayLabel(_ sender: Any) {
        pickerView.isHidden = false
    }
    
    @IBAction func didTappedCancelButton(_ sender: Any) {
        pickerView.isHidden = true
    }
    
    @IBAction func didTappedOKButton(_ sender: Any) {
        UserData.shared.birthday = birthdayLabel.text
        
        if isChanged {
            self.navigationController?.popViewController(animated: true)
            isChanged = false
            
        } else {
            let vc = UIStoryboard(name: "RegistrationEmailAndPassword", bundle: nil).instantiateViewController(withIdentifier: "RegistrationEmailAndPassword") as! RegistrationEmailAndPasswordViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
