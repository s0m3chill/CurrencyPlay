//
//  BestRateMapInteractor.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import CoreLocation

/// BestRateMap Module Interactor
class BestRateMapInteractor: BestRateMapInteractorProtocol {
    
    func fetch(objectFor presenter: BestRateMapPresenterProtocol, with entity: BestRateMapEntity) {
        let fetchQueue = OperationQueue()
        
        var selectedCoords: CLLocationCoordinate2D?
        let selectedCurrencyGeocode = BlockOperation {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(entity.selectedExchange.address) { [weak self] placemark, error in
                guard let sself = self else { return }
                
                guard let place = placemark,
                      let coords = place.first?.location?.coordinate
                else {
                    presenter.interactor(sself, didFailWith: FetchErrors.addressNotGeocoded)
                    return
                }
                
                selectedCoords = coords
            }
        }
        
        let bestCurrencyGeocode = BlockOperation {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(entity.bestExchange.address) { [weak self] placemark, error in
                guard let sself = self else { return }
                
                guard let place = placemark,
                      let coords = place.first?.location?.coordinate,
                      let selCoords = selectedCoords
                else {
                    presenter.interactor(sself, didFailWith: FetchErrors.addressNotGeocoded)
                    return
                }
                let coordinates = ExchangeCoordinates(selected: selCoords, best: coords)
                presenter.interactor(sself, didFetch: coordinates)
            }
        }
        
        bestCurrencyGeocode.addDependency(selectedCurrencyGeocode)
        fetchQueue.addOperations([selectedCurrencyGeocode, bestCurrencyGeocode], waitUntilFinished: true)
    }
    
}
