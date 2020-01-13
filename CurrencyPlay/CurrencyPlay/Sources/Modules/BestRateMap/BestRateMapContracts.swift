//
//  BestRateMapContracts.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// BestRateMap Module View Protocol
protocol BestRateMapViewProtocol: class {
    func set(object: BestRateMapEntity)
    func updateMapWith(coordinates: ExchangeCoordinates)
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
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetchCoordinates(for view: BestRateMapViewProtocol, with object: BestRateMapEntity)
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
