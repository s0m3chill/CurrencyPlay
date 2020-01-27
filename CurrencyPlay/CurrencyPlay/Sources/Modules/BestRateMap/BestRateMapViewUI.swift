//
//  BestRateMapViewUI.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit
import MapKit

class BestRateMapViewUI: UIView {
    
    typealias Container = MKMapViewDelegate
    
    private weak var delegate: Container?
    private var selectedAnnotation = MKPointAnnotation()
    private var bestAnnotation = MKPointAnnotation()
    
    private lazy var mapView: MKMapView = {
        let ret = MKMapView()
        ret.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return ret
    }()
    
    init(delegate: Container) {
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
}

extension BestRateMapViewUI: BestRateMapViewUIInput {
    
    func setupUIElements() {
        addSubview(mapView)
        
        mapView.register(MKPinAnnotationView.self, forAnnotationViewWithReuseIdentifier: "annotation")
        mapView.delegate = delegate
    }
    
    func updateMapWith(coordinates: ExchangeCoordinates) {
        selectedAnnotation.coordinate = coordinates.selected
        selectedAnnotation.title = "Selected"
        mapView.addAnnotation(selectedAnnotation)
        
        bestAnnotation.coordinate = coordinates.best
        bestAnnotation.title = "Best"
        
        mapView.selectAnnotation(selectedAnnotation, animated: true)
        
        delay(3) {
            self.mapView.addAnnotation(self.bestAnnotation)
        }
    }
    
    func setMap(region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: true)
        mapView.selectAnnotation(bestAnnotation, animated: true)
    }
    
}
