//
//  CombinedRatesAPI.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 05.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation
import Moya

enum CombinedRatesAPI {
    /// http://resources.finance.ua/ua/public/currency-cash.json
    /// App must include reference to  https://finance.ua/ua/currency
    case exchangeRates
}

extension CombinedRatesAPI: TargetType {
    
    private enum URLs: String {
       case baseUrl = "http://resources.finance.ua/ua/public/"
    }
       
    var baseURL: URL {
       return URL(string: URLs.baseUrl.rawValue) ?? URL(fileURLWithPath: "")
    }
    
    var path: String {
        switch self {
        case .exchangeRates:
            return "currency-cash.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .exchangeRates:
            return Task.requestPlain
        }
    }
    
}
