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
        let fetchQueue = OperationQueue()
        
        var bankInfos: [ExchangeOverviewEntity.BankCurrencyInfo] = []
        let combinedFetchOperation = BlockOperation {
            self.combinedService.getExchangeRates { rates in
                for rate in rates {
                    let bankInfo = ExchangeOverviewEntity.BankCurrencyInfo(name: rate.title,
                                                                           buy: rate.currencies.bid,
                                                                           sale: rate.currencies.ask)
                    bankInfos.append(bankInfo)
                }
            }
        }
        
        let privatFetchOperation = BlockOperation {
            self.privatService.getExchangeRates { rates in
                guard let usdRate = (rates.filter { $0.ccy == "USD" }.first) else {
                    presenter.interactor(self, didFailWith: FetchErrors.privatCurrencyNoUsd)
                    return
                }
                let bankInfo = ExchangeOverviewEntity.BankCurrencyInfo(name: "Приватбанк",
                                                                       buy: usdRate.buy,
                                                                       sale: usdRate.sale)
                bankInfos.append(bankInfo)
                presenter.interactor(self, didFetch: ExchangeOverviewEntity(banksCurrencies: bankInfos))
            }
        }
        
        privatFetchOperation.addDependency(combinedFetchOperation)
        fetchQueue.addOperations([combinedFetchOperation, privatFetchOperation], waitUntilFinished: true)
    }
        
}
