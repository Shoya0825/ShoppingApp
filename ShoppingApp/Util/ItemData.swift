//
//  ItemData.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/31.
//

import UIKit
import RealmSwift

class ItemData: Object {
    
    static let shared = ItemData()
    
    @objc dynamic var itemName: String?
    @objc dynamic var itemPrice: String?
    @objc dynamic var itemImage: UIImage?
    
    
    
    
    
}
