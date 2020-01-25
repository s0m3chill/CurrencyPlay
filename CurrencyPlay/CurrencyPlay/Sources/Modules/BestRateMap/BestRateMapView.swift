//
//  BestRateMapView.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit
import MapKit

/// BestRateMap Module View
class BestRateMapView: UIViewController {
    
    private var ui: BestRateMapViewUIInput!
    private let presenter: BestRateMapPresenterProtocol!
        
    init(presenter: BestRateMapPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        presenter.set(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        ui = BestRateMapViewUI(delegate: self)
        view = ui
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.fetchCoordinates(for: self)
    }
    
}

// MARK: - extending BestRateMapView to implement it's protocol
extension BestRateMapView: BestRateMapViewInput {
    
    func updateMapWith(coordinates: ExchangeCoordinates) {
        //ui.reloadData(with: coordinates)
    }
    
}

// MARK: - extending BestRateMapView to implement the custom ui view delegate
extension BestRateMapView: BestRateMapViewUIDelegate {
    
}
