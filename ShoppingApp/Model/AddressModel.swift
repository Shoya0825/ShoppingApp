//
//  AddressModel.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/20.
//

struct AddressModel: Decodable {
    var results: [Result]

        struct Result: Decodable {
            var address1: String
            var address2: String
            var address3: String
            var kana1: String
            var kana2: String
            var kana3: String
        }
}
