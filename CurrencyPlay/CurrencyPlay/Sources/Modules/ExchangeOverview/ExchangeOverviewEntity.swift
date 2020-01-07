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
        let sale: String
        
        init(name: String, buy: String, sale: String) {
            self.name = name
            self.buy = String(format: "%.2f", Double(buy) ?? 0)
            self.sale = String(format: "%.2f", Double(sale) ?? 0)
        }
    }
}
