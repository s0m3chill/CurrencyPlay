//
//  ExchangeOverviewViewUI.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

// MARK: ExchangeOverviewViewUI Delegate -
/// ExchangeOverviewViewUI Delegate
protocol ExchangeOverviewViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: ExchangeOverviewViewUI Data Source -
/// ExchangeOverviewViewUI Data Source
protocol ExchangeOverviewViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: ExchangeOverviewViewUI) -> ExchangeOverviewEntity
}

class ExchangeOverviewViewUI: UIView {
    
    var delegate: ExchangeOverviewViewUIDelegate?
    var dataSource: ExchangeOverviewViewUIDataSource?
    
    var object : ExchangeOverviewEntity?
    
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
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        // Should update UI
    }
    
}
