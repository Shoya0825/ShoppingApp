//
//  AddressRequest.swift
//  ShoppingApp
//
//  Created by 1105449 on 2023/03/22.
//

import UIKit
import Alamofire

class AddressRequest {
    
    var addresses: AddressModel?
    
    func requestAddress(zipCode: String, completion: @escaping(Bool, Error?) -> Void) {
        let url = Const.zipCodeSearchApi.baseUrl
        let params: [String: Any] = ["zipcode": zipCode]
        let headers: HTTPHeaders = ["ContentType": "application/json"]
        
        AF.request(url,
                   method: .get,
                   parameters: params,
                   encoding: URLEncoding(destination: .queryString),
                   headers: headers).responseData { response in
            
            guard let data = response.data else {
                let error = NSError(domain: "error", code: 0)
                completion(false, error)
                return
            }
            do {
                self.addresses = try JSONDecoder().decode(AddressModel.self, from: data)
                if let address = self.addresses {
                    print("\(address.results[0].address1) \(address.results[0].address2) \(address.results[0].address3)")
                }
                completion(true, nil)
                
            } catch let error {
                print("Error:\(error)")
                completion(false, error)
            }
        }
    }
}
