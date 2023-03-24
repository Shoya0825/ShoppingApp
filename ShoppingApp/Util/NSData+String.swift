//
//  NSData+String.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/24.
//

import UIKit

class BirthDateFormatter {
    
    private var dateString: String = ""
    private let formatter = DateFormatter()
    
    
    var birtdate: Date? {
        didSet {
            formatter.locale = Locale(identifier: "ja_JP")
            formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
            formatter.calendar = Calendar(identifier: .gregorian)
            formatter.dateFormat = "yyyy年MM月dd日"
        }
    }
    
    var birthdateString: String? {
        
        get {
            if let birtdate = birtdate {
                return formatter.string(from: birtdate)
            } else {
                return ""
            }
        }
        set {
            if let dateString = newValue {
                birtdate = formatter.date(from: dateString)
            }
        }
    }
    
}
