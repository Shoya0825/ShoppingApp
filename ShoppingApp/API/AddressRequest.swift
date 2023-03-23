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
    
    func requestAddress(zipCode: String, completion: @escaping(AddressModel?, Bool, Error?) -> Void) {
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
                completion(nil, false, error)
                return
            }
            do {
                self.addresses = try JSONDecoder().decode(AddressModel.self, from: data)
                if let address = self.addresses {
                    completion(address, true, nil)
                }
            } catch let error {
                completion(nil, false, error)
            }
        }
    }
}
