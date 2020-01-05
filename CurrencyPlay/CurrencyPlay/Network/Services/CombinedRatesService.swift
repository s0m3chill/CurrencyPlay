//
//  CombinedRatesService.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 05.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation
import Moya

class CombinedRatesService {
    
    private let provider = MoyaProvider<CombinedRatesAPI>()
    
    func getExchangeRates(completion: @escaping ([OrganizationItem]) -> Void) {
        request(target: .exchangeRates,
                success: { response in
            guard let organizationsArray = response["organizations"] as? [[String: Any]] else {
                completion([])
                return
            }
                    
            var organizations: [OrganizationItem] = []
            for item in organizationsArray {
                let jsonData = try! JSONSerialization.data(withJSONObject: item, options: .prettyPrinted)
                let organization = try! JSONDecoder().decode(OrganizationItem.self, from: jsonData)
                organizations.append(organization)
            }
                            
            completion(organizations)
        },
            failure: { error in
                print(error?.localizedDescription ?? "")
                completion([])
        })
    }
    
    private func request(target: CombinedRatesAPI,
                         success successCallback: @escaping ([String: AnyObject]) -> Void,
                         failure failureCallback: @escaping (Swift.Error?) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                ResponseParser.parseJson(response: response,
                                         urlPath: target.path,
                                         callback: { dataDict in
                    successCallback(dataDict)
                }, failure: { error in
                    failureCallback(MoyaError.jsonMapping(response))
                })
            case .failure(let error):
                print("Response for: \(target.path) server communication error: \(String(describing: error.errorDescription))")
                failureCallback(error)
            }
        }
    }
    
}
