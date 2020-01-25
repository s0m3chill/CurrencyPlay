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
    
    weak private var _view: BestRateMapViewInput?
    private var _object: BestRateMapEntity?
    private var interactor: BestRateMapInteractorProtocol
    private var wireframe: BestRateMapRouterProtocol
    
    init() {
        self.interactor = BestRateMapInteractor()
        self.wireframe = BestRateMapRouter()
    }
}

// MARK: - extending BestRateMapPresenter to implement it's protocol
extension BestRateMapPresenter: BestRateMapPresenterProtocol {
    
    func set(view: BestRateMapViewInput) {
        _view = view
    }
    
    func set(object: BestRateMapEntity) {
        _object = object
    }
    
    func fetchCoordinates(for view: BestRateMapViewInput) {
        interactor.fetch(objectFor: self, with: _object!)
    }
    
    func interactor(_ interactor: BestRateMapInteractorProtocol, didFetch coordinates: ExchangeCoordinates) {
        _view?.updateMapWith(coordinates: coordinates)
    }
    
    func interactor(_ interactor: BestRateMapInteractorProtocol, didFailWith error: Error) {
        
    }
        
}
