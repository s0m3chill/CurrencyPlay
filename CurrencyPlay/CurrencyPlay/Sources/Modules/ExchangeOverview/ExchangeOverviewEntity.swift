//
//  ExchangeOverviewEntity.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// ExchangeOverview Module Entity
struct ExchangeOverviewEntity {
    let banksCurrencies: [BankCurrencyInfo]
    
    struct BankCurrencyInfo {
        let name: String
        let buy: String
        let sell: String
        let address: String
        
        init(name: String, buy: String, sale: String, address: String) {
            self.name = name
            self.buy = String(format: "%.2f", Double(buy) ?? 0)
            self.sell = String(format: "%.2f", Double(sale) ?? 0)
            self.address = address
        }
    }
}
