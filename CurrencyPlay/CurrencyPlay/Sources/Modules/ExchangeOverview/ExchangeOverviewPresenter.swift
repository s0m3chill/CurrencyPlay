//
//  ExchangeOverviewPresenter.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// ExchangeOverview Module Presenter
class ExchangeOverviewPresenter {
    
    weak private var _view: ExchangeOverviewViewInput?
    private var interactor: ExchangeOverviewInteractorProtocol
    private var wireframe: ExchangeOverviewRouterProtocol
    private var object: ExchangeOverviewEntity?
    private var bestBuy: ExchangeOverviewEntity.BankCurrencyInfo?
    
    init(view: ExchangeOverviewViewInput) {
        self._view = view
        self.interactor = ExchangeOverviewInteractor()
        self.wireframe = ExchangeOverviewRouter()
    }
}

// MARK: - extending ExchangeOverviewPresenter to implement it's protocol
extension ExchangeOverviewPresenter: ExchangeOverviewPresenterProtocol {
    
    func fetch(objectFor view: ExchangeOverviewViewInput) {
        interactor.fetch(objectFor: self)
    }
    
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol,
                    didFetch object: ExchangeOverviewEntity) {
        self.object = object
      
        guard let bestBuy = (object.banksCurrencies.min { $0.sell < $1.sell }) else {
            fatalError("no sell info")
        }
        self.bestBuy = bestBuy
        _view?.reloadData()
    }
    
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol,
                    didFailWith error: Error) {
        
    }
    
    func view(_ view: ExchangeOverviewViewInput, didSelectRow atIndex: Int) {
        guard let selectedExchange = object?.banksCurrencies[atIndex], let bestExchange = bestBuy else {
            return
        }
        
        let bestRateMapEntity = BestRateMapEntity(selectedExchange: selectedExchange,
                                                  bestExchange: bestExchange)
        wireframe.showDetailsFor(object: bestRateMapEntity, parentViewController: view)
    }
    
}

extension ExchangeOverviewPresenter: ExchangeOverviewViewDataSource {
    
    func sectionsCount() -> Int {
        return 1
    }
    
    func rowsCount() -> Int {
        return object?.banksCurrencies.count ?? 0
    }
    
    func title(for row: Int) -> String {
        guard let obj = object else {
            return ""
        }
        let currency = obj.banksCurrencies[row]
        return "\(currency.name), buy: \(currency.buy), sale: \(currency.sell)"
    }
    
}
