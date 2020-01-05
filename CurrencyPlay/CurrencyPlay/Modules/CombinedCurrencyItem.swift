//
//  OrganizationItem.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 05.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation

struct CombinedCurrencyItem: Decodable {
    let id: String
    let oldId: Int
    let orgType: Int
    let branch: Bool
    let title: String
    let regionId: String
    let cityId: String
    let phone: String
    let address: String
    let link: String
    let currencies: Currency
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case oldId = "oldId"
        case orgType = "orgType"
        case branch = "branch"
        case title = "title"
        case regionId = "regionId"
        case cityId = "cityId"
        case phone = "phone"
        case address = "address"
        case link = "link"
        case currencies = "currencies"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        oldId = try container.decode(Int.self, forKey: .oldId)
        orgType = try container.decode(Int.self, forKey: .orgType)
        branch = try container.decode(Bool.self, forKey: .branch)
        title = try container.decode(String.self, forKey: .title)
        regionId = try container.decode(String.self, forKey: .regionId)
        cityId = try container.decode(String.self, forKey: .cityId)
        phone = try container.decode(String.self, forKey: .phone)
        address = try container.decode(String.self, forKey: .address)
        link = try container.decode(String.self, forKey: .link)
        currencies = try container.decode(Currency.self, forKey: .currencies)
    }
    
    struct Currency: Decodable {
        let ask: String
        let bid: String
        
        enum CodingKeys: String, CodingKey {
            case usd = "USD"
            case ask = "ask"
            case bid = "bid"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            guard let usd = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .usd) else {
                ask = ""
                bid = ""
                return
            }
            ask = try usd.decode(String.self, forKey: .ask)
            bid = try usd.decode(String.self, forKey: .bid)
        }
    }
}
