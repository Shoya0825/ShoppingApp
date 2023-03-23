//
//  AddressModel.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/20.
//

struct AddressModel: Decodable {
    let results: [Result]

    struct Result: Decodable {
        let address1: String
        let address2: String
        let address3: String
    }
    
    struct Messsage: Decodable {
        let message: String
    }
}
