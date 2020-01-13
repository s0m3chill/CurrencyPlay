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
    
    weak private var _view: ExchangeOverviewViewProtocol?
    private var interactor: ExchangeOverviewInteractorProtocol
    private var wireframe: ExchangeOverviewRouterProtocol
    private var object: ExchangeOverviewEntity?
    
    init(view: ExchangeOverviewViewProtocol) {
        self._view = view
        self.interactor = ExchangeOverviewInteractor()
        self.wireframe = ExchangeOverviewRouter()
    }
}

// MARK: - extending ExchangeOverviewPresenter to implement it's protocol
extension ExchangeOverviewPresenter: ExchangeOverviewPresenterProtocol {
    
    func fetch(objectFor view: ExchangeOverviewViewProtocol) {
        interactor.fetch(objectFor: self)
    }
    
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol,
                    didFetch object: ExchangeOverviewEntity) {
        self.object = object
        _view?.reloadData()
    }
    
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol,
                    didFailWith error: Error) {
        
    }
    
    func view(_ view: ExchangeOverviewViewProtocol, didSelectRow atIndex: Int) {
        guard let selectedObject = object?.banksCurrencies[atIndex] else {
            return
        }
        wireframe.showDetailsFor(object: selectedObject, parentViewController: view)
    }
    
}

extension ExchangeOverviewPresenter: ExchangeOverviewViewUIDataSource {
    
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
        return "\(currency.name), buy: \(currency.buy), sale: \(currency.sale)"
    }
    
}
