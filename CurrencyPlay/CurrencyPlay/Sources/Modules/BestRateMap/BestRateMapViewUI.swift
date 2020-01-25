//
//  BestRateMapViewUI.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit
import MapKit

// MARK: BestRateMapViewUI Delegate -
/// BestRateMapViewUI Delegate
protocol BestRateMapViewUIDelegate: class {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

class BestRateMapViewUI: UIView {
    
    private weak var delegate: BestRateMapViewUIDelegate?
    
    private lazy var mapView: MKMapView = {
        let ret = MKMapView()
        ret.translatesAutoresizingMaskIntoConstraints = false
        
        return ret
    }()
    
    init(delegate: BestRateMapViewUIDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BestRateMapViewUI: BestRateMapViewUIInput {
    
    func reloadData() {
        
    }
    
}
