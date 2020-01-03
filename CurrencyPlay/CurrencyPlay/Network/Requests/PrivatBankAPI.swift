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
    /// https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5
    case exchangeRate
    /// https://api.privatbank.ua/p24api/pboffice?city=Днепропетровск&address=Титова
    case offices
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
        case .offices:
            return "pboffice"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .exchangeRate:
            let params: [String: Any] = ["json": "", "exchange": "", "coursid": "5"]
            return Task.requestParameters(parameters: params, encoding: URLEncoding.default)
        case .offices:
            let params: [String: Any] = ["json": "", "city": "Львов", "address": ""]
            return Task.requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
}
