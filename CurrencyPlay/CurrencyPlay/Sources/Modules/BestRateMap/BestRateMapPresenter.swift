//
//  BestRateMapPresenter.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// BestRateMap Module Presenter
class BestRateMapPresenter {
    
    weak private var _view: BestRateMapViewProtocol?
    private var interactor: BestRateMapInteractorProtocol
    private var wireframe: BestRateMapRouterProtocol
    
    init(view: BestRateMapViewProtocol) {
        self._view = view
        self.interactor = BestRateMapInteractor()
        self.wireframe = BestRateMapRouter()
    }
}

// MARK: - extending BestRateMapPresenter to implement it's protocol
extension BestRateMapPresenter: BestRateMapPresenterProtocol {
    
    func fetchCoordinates(for view: BestRateMapViewProtocol, with object: BestRateMapEntity) {
        interactor.fetch(objectFor: self, with: object)
    }
    
    func interactor(_ interactor: BestRateMapInteractorProtocol, didFetch coordinates: ExchangeCoordinates) {
        _view?.updateMapWith(coordinates: coordinates)
    }
    
    func interactor(_ interactor: BestRateMapInteractorProtocol, didFailWith error: Error) {
        
    }
        
}
