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
        var selectedCoords: CLLocationCoordinate2D?
        var bestCoords: CLLocationCoordinate2D?

        let group = DispatchGroup()
        let queue = DispatchQueue.global(qos: .userInitiated)
        
        group.enter()
        queue.async(group: group) {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(entity.selectedExchange.address) { [weak self] placemark, error in
                defer { group.leave() }
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
        
        group.enter()
        queue.async(group: group) {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(entity.bestExchange.address) { [weak self] placemark, error in
                defer { group.leave() }
                guard let sself = self else { return }
                
                guard let place = placemark,
                      let coords = place.first?.location?.coordinate
                else {
                    presenter.interactor(sself, didFailWith: FetchErrors.addressNotGeocoded)
                    return
                }
                
                bestCoords = coords
            }
        }
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            guard let sself = self else { return }
            guard let selected = selectedCoords, let best = bestCoords else { return }
            
            presenter.interactor(sself, didFetch: ExchangeCoordinates(selected: selected, best: best))
        }
    }
    
}
