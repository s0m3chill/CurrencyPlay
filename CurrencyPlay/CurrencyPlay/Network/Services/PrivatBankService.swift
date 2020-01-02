//
//  PrivatBankService.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 02.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation
import Moya

class PrivatBankService {
    
    private let provider = MoyaProvider<PrivatBankAPI>()
    
    func getExchangeRates() {
        request(target: .exchangeRate,
                success: { response in
                    print(response)
                    
        },
                failure: { error in
                    print(error?.localizedDescription ?? "")
        })
    }
    
    private func request(target: PrivatBankAPI,
                         success successCallback: @escaping ([[String: AnyObject]]) -> Void,
                         failure failureCallback: @escaping (Swift.Error?) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                ResponseParser.parse(response: response,
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
