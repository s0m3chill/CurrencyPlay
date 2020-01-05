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
    
    func getExchangeRates(completion: @escaping ([PrivatCurrencyItem]) -> Void) {
        request(target: .exchangeRate,
                success: { response in
            var currencies: [PrivatCurrencyItem] = []
            for item in response {
                if let currencyItem = try? PrivatCurrencyItem(dict: item) {
                    currencies.append(currencyItem)
                }
            }
            completion(currencies)
        },
            failure: { error in
                print(error?.localizedDescription ?? "")
                completion([])
        })
    }
    
    func getNearestOffices(completion: @escaping ([PrivatOfficeItem]) -> Void) {
        request(target: .offices,
                success: { response in
            var offices: [PrivatOfficeItem] = []
            for item in response {
                if let officeItem = try? PrivatOfficeItem(dict: item) {
                    offices.append(officeItem)
                }
            }
            completion(offices)
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
                ResponseParser.parseJsonArray(response: response,
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
