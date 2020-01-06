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
    
    init(view: ExchangeOverviewViewProtocol) {
        self._view = view
        self.interactor = ExchangeOverviewInteractor()
        self.wireframe = ExchangeOverviewRouter()
    }
}

// MARK: - extending ExchangeOverviewPresenter to implement it's protocol
extension ExchangeOverviewPresenter: ExchangeOverviewPresenterProtocol {
    func fetch(objectFor view: ExchangeOverviewViewProtocol) {
        
    }
    
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol, didFetch object: ExchangeOverviewEntity) {
        
    }
    
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol, didFailWith error: Error) {
        
    }
    
    
}
