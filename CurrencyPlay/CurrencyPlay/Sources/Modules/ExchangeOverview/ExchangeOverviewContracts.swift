//
//  ExchangeOverviewContracts.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// ExchangeOverview Module View Protocol
protocol ExchangeOverviewViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type ExchangeOverviewEntity
    func set(object: ExchangeOverviewEntity)
}

//MARK: Interactor -
/// ExchangeOverview Module Interactor Protocol
protocol ExchangeOverviewInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: ExchangeOverviewPresenterProtocol)
}

//MARK: Presenter -
/// ExchangeOverview Module Presenter Protocol
protocol ExchangeOverviewPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: ExchangeOverviewViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol, didFetch object: ExchangeOverviewEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// ExchangeOverview Module Router Protocol
protocol ExchangeOverviewRouterProtocol {
    static func createModule() -> UIViewController
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: ExchangeOverviewEntity, parentViewController viewController: UIViewController)
}
