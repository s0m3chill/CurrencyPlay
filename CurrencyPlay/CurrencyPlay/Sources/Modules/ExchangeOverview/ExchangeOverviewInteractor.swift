//
//  ExchangeOverviewInteractor.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// ExchangeOverview Module Interactor
class ExchangeOverviewInteractor: ExchangeOverviewInteractorProtocol {
    
    private let privatService = PrivatBankService()
    private let combinedService = CombinedRatesService()
    
    func fetch(objectFor presenter: ExchangeOverviewPresenterProtocol) {
        privatService.getExchangeRates { rates in
            guard let usdRate = (rates.filter { $0.ccy == "USD" }.first) else {
                presenter.interactor(self, didFailWith: FetchErrors.privatCurrencyNoUsd)
                return
            }
            let bankInfo = ExchangeOverviewEntity.BankCurrencyInfo(name: "Приватбанк",
                                                                   buy: usdRate.buy,
                                                                   sale: usdRate.sale)
       
            presenter.interactor(self, didFetch: ExchangeOverviewEntity(banksCurrencies: [bankInfo]))
        }
        
        combinedService.getExchangeRates { rates in
            var bankInfos: [ExchangeOverviewEntity.BankCurrencyInfo] = []
            for rate in rates {
                let bankInfo = ExchangeOverviewEntity.BankCurrencyInfo(name: rate.title,
                                                                       buy: rate.currencies.bid,
                                                                       sale: rate.currencies.ask)
                bankInfos.append(bankInfo)
            }
            presenter.interactor(self, didFetch: ExchangeOverviewEntity(banksCurrencies: bankInfos))
        }
    }
        

}
