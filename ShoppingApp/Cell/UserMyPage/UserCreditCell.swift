//
//  UserCreditCell.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/15.
//

import UIKit

class UserCreditCell: UITableViewCell {
    
    
    @IBOutlet weak var userCreditLabel: UILabel!
    @IBOutlet weak var creditChargeButton: UIButton!
    @IBOutlet weak var creditChargeLabel: UILabel!
    @IBOutlet weak var creditChargeStepper: UIStepper!
    @IBOutlet weak var creditChargeOKButton: UIButton!
    @IBOutlet weak var creditChargeCloseLabel: UILabel!
    
    var userCredit = 0
    var creditAddValue = 0
    
    var creditIsHidden = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func didTappedCreditChargeButton(_ sender: Any) {
        if creditIsHidden == true {
            creditChargeLabel.isHidden = false
            creditChargeStepper.isHidden = false
            creditChargeOKButton.isHidden = false
            creditChargeCloseLabel.isHidden = false
            creditIsHidden = false
            
        } else {
            creditChargeLabel.isHidden = true
            creditChargeStepper.isHidden = true
            creditChargeOKButton.isHidden = true
            creditChargeCloseLabel.isHidden = true
            creditIsHidden = true
        }
    }
    
    
    @IBAction func creditChargeStepper(_ sender: UIStepper) {
        creditChargeLabel.text = "￥\(Int(sender.value).formattedWithSeparator)"
        creditAddValue = Int(sender.value)
    }
    
    @IBAction func didTappedCreditChargeOKButton(_ sender: Any) {
        let addedCreditValue = (userCredit + creditAddValue)
        userCreditLabel.text = "￥\(addedCreditValue.formattedWithSeparator)"
        
        creditChargeLabel.text = "￥0"
        creditChargeStepper.value = 0
        userCredit = addedCreditValue
    }
    
    
}
extension Int {
    var formattedWithSeparator: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
