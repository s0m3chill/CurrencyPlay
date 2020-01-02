//
//  PrivatBankAPI.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 02.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation
import Moya

enum PrivatBankAPI {
    case exchangeRate
}

extension PrivatBankAPI: TargetType {
    
    private enum URLs: String {
        case baseUrl = "https://api.privatbank.ua/p24api/"
    }
    
    var baseURL: URL {
        return URL(string: URLs.baseUrl.rawValue) ?? URL(fileURLWithPath: "")
    }
    
    var path: String {
        switch self {
        case .exchangeRate:
            return "pubinfo"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .exchangeRate:
            let params: [String: Any] = ["json": "", "exchange": "", "courseid": 5]
            return Task.requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
}
