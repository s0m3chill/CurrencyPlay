//
//  BestRateMapViewUI.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

// MARK: BestRateMapViewUI Delegate -
/// BestRateMapViewUI Delegate
protocol BestRateMapViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

class BestRateMapViewUI: UIView {
    
    var delegate: BestRateMapViewUIDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData(with coordinates: ExchangeCoordinates) {
        
    }
    
}
