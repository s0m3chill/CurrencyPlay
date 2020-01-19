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
        var bankInfos: [ExchangeOverviewEntity.BankCurrencyInfo] = []

        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        group.enter()
        queue.async(group: group) {
            self.combinedService.getExchangeRates { [weak self] rates in
                defer { group.leave() }
                guard let sself = self else { return }
                
                for rate in rates {
                    let bankInfo = ExchangeOverviewEntity.BankCurrencyInfo(name: rate.title,
                                                                           buy: rate.currencies.bid,
                                                                           sale: rate.currencies.ask,
                                                                           address: rate.address)
                    bankInfos.append(bankInfo)
                }
            }
        }
        
        group.enter()
        queue.async(group: group) {
            self.privatService.getExchangeRates { [weak self] rates in
                defer { group.leave() }
                guard let sself = self else { return }
                
                guard let usdRate = (rates.filter { $0.ccy == "USD" }.first) else {
                    presenter.interactor(sself, didFailWith: FetchErrors.privatCurrencyNoUsd)
                    return
                }
                let bankInfo = ExchangeOverviewEntity.BankCurrencyInfo(name: "Приватбанк",
                                                                       buy: usdRate.buy,
                                                                       sale: usdRate.sale,
                                                                       address: "вул. Героїв УПА, 76")
                bankInfos.append(bankInfo)
            }
        }
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            guard let sself = self else { return }
            presenter.interactor(sself, didFetch: ExchangeOverviewEntity(banksCurrencies: bankInfos))
        }
    }
        
}
