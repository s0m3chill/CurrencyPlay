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
    
    private var object : ExchangeOverviewEntity!
    
    private lazy var stackView: UIStackView = {
        let ret = UIStackView()
        ret.translatesAutoresizingMaskIntoConstraints = false
        ret.axis = .vertical
        
        addSubview(ret)
        
        ret.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        ret.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        ret.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        return ret
    }()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        setupConstraints()
        backgroundColor = .white
    }
    
    fileprivate func setupUIElements() {
        for item in object.banksCurrencies {
            let label = UILabel()
            label.text = "\(item.name), buy: \(item.buy), sale: \(item.sale)"
            stackView.addArrangedSubview(label)
        }
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        guard let dataObject = dataSource?.objectFor(ui: self) else {
            return
        }
        self.object = dataObject
        setupUIElements()
    }
    
}
