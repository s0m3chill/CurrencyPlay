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
        ui.setupUIElements()
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
        let selectedAnnotation = MKPointAnnotation()
        let bestAnnotation = MKPointAnnotation()

        selectedAnnotation.coordinate = coordinates.selected
        selectedAnnotation.title = "Selected"
        bestAnnotation.coordinate = coordinates.best
        bestAnnotation.title = "Best"
        
        ui.addAndSelect(annotation: selectedAnnotation)
        
        delay(2) {
            self.ui.addAndSelect(annotation: bestAnnotation)
        }
    }
    
}

extension BestRateMapView: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation") as? MKPinAnnotationView
        else {
            return nil
        }
    
        annotationView.pinTintColor = .red
        annotationView.canShowCallout = true
        annotationView.animatesDrop = true
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        guard let addedView = views.first,
              let pinToZoomOn = addedView.annotation
        else {
            return
        }
        let spanValue: CLLocationDegrees = 0.2
        let span = MKCoordinateSpan(latitudeDelta: spanValue,
                                    longitudeDelta: spanValue)
        
        let region = MKCoordinateRegion(center: pinToZoomOn.coordinate, span: span)
        ui.setMap(region: region)
    }
    
}
