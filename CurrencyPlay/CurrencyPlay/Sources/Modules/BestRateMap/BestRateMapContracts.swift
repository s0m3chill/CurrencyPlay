//
//  BestRateMapContracts.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit
import MapKit

//MARK: View -

/// BestRateMap Module View Protocol
protocol BestRateMapViewInput where Self: UIViewController {
    func updateMapWith(coordinates: ExchangeCoordinates)
}

protocol BestRateMapViewUIInput where Self: UIView {
    func setupUIElements()
    func updateMapWith(coordinates: ExchangeCoordinates)
    func setMap(region: MKCoordinateRegion)
}

//MARK: Interactor -
/// BestRateMap Module Interactor Protocol
protocol BestRateMapInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: BestRateMapPresenterProtocol, with entity: BestRateMapEntity)
}

//MARK: Presenter -
/// BestRateMap Module Presenter Protocol
protocol BestRateMapPresenterProtocol {
    func set(view: BestRateMapViewInput)
    func set(object: BestRateMapEntity)
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetchCoordinates(for view: BestRateMapViewInput)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: BestRateMapInteractorProtocol, didFetch coordinates: ExchangeCoordinates)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: BestRateMapInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// BestRateMap Module Router Protocol
protocol BestRateMapRouterProtocol {
    static func createModule(with data: BestRateMapEntity) -> UIViewController
}
