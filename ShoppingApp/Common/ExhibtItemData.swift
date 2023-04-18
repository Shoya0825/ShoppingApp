//
//  ExhibtItemData.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/04/18.
//

import UIKit
import RealmSwift

class ExhibtItemData: Object {
    
    static let shared = ExhibtItemData()
    
    @objc dynamic var itemImages: [UIImage] = []
    
}
