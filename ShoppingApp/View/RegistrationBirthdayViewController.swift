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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale = Locale(identifier: "ja_JP")
        datePicker.timeZone = TimeZone(identifier: "Asia/Tokyo")
        datePicker.calendar = Calendar(identifier: .gregorian)
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
    
}
