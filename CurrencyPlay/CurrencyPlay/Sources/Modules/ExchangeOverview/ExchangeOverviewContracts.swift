//
//  ExchangeOverviewContracts.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

//MARK: View -

/// ExchangeOverview Module View Protocol
protocol ExchangeOverviewViewInput where Self: UIViewController {
    func reloadData()
}

protocol ExchangeOverviewUIInput where Self: UIView {
    func setupUIElements()
    func reloadData()
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
    func fetch(objectFor view: ExchangeOverviewViewInput)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol, didFetch object: ExchangeOverviewEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: ExchangeOverviewInteractorProtocol, didFailWith error: Error)
    func view(_ view: ExchangeOverviewViewInput, didSelectRow atIndex: Int)
}

//MARK: Router (aka: Wireframe) -
/// ExchangeOverview Module Router Protocol
protocol ExchangeOverviewRouterProtocol {
    static func createInitialModule() -> UIViewController
    func showDetailsFor(object: BestRateMapEntity,
                        parentViewController viewController: ExchangeOverviewViewInput)
}
