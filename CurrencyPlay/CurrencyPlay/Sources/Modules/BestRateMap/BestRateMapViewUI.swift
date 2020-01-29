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
    
    func addAndSelect(annotation: MKPointAnnotation) {
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
    }
    
    func setMap(region: MKCoordinateRegion) {
        mapView.setRegion(region, animated: true)
    }
    
}
