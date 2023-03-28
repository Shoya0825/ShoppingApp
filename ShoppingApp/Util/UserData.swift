//
//  UserData.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/28.
//

import UIKit

class UserData {
    
    let shared = UserData()
    
    var kanjiLastName: String?
    var kanjiFirstName: String?
    var kanaLastName: String?
    var kanaFirstName: String?
    
    var birthday: String?
    
    var zipCode: String?
    var prefecture: String?
    var address: String?
    
    var email: String?
    var password: String?
    
    func reset() {
        kanjiLastName = ""
        kanjiFirstName = ""
        kanaLastName = ""
        kanaFirstName = ""
        birthday = ""
        zipCode = ""
        prefecture = ""
        address = ""
        email = ""
        password = ""
    }
}
