//
//  UserData.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/28.
//

import UIKit
import RealmSwift

class UserData: Object {
    
    static let shared = UserData()
    
    @objc dynamic var kanjiLastName: String?
    @objc dynamic var kanjiFirstName: String?
    @objc dynamic var kanaLastName: String?
    @objc dynamic var kanaFirstName: String?
    
    @objc dynamic var birthday: String?
    
    @objc dynamic var zipCode: String?
    @objc dynamic var prefecture: String?
    @objc dynamic var address: String?
    
    @objc dynamic var email: String?
    @objc dynamic var password: String?
    
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
