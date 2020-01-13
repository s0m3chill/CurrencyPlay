//
//  BestRateMapView.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// BestRateMap Module View
class BestRateMapView: UIViewController {
    
    private let ui = BestRateMapViewUI()
    private var presenter: BestRateMapPresenterProtocol!
    
    private var object : BestRateMapEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = BestRateMapPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetchCoordinates(for: self, with: object!)
    }
    
}

// MARK: - extending BestRateMapView to implement it's protocol
extension BestRateMapView: BestRateMapViewProtocol {
    
    func set(object: BestRateMapEntity) {
        self.object = object
    }
    
    func updateMapWith(coordinates: ExchangeCoordinates) {
        ui.reloadData(with: coordinates)
    }
    
}

// MARK: - extending BestRateMapView to implement the custom ui view delegate
extension BestRateMapView: BestRateMapViewUIDelegate {
    
}
