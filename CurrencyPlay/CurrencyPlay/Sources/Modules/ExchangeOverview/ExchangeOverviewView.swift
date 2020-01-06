//
//  ExchangeOverviewView.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// ExchangeOverview Module View
class ExchangeOverviewView: UIViewController {
    
    private let ui = ExchangeOverviewViewUI()
    private var presenter: ExchangeOverviewPresenterProtocol!
    
    private var object : ExchangeOverviewEntity?
    
    override func loadView() {
        // setting the custom view as the view controller's view
        ui.delegate = self
        ui.dataSource = self
        view = ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ExchangeOverviewPresenter(view: self)
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
        
        view.backgroundColor = .red
    }
    
}

// MARK: - extending ExchangeOverviewView to implement it's protocol
extension ExchangeOverviewView: ExchangeOverviewViewProtocol {
    
    func set(object: ExchangeOverviewEntity) {
        
    }
    
}

// MARK: - extending ExchangeOverviewView to implement the custom ui view delegate
extension ExchangeOverviewView: ExchangeOverviewViewUIDelegate {
    
}

// MARK: - extending ExchangeOverviewView to implement the custom ui view data source
extension ExchangeOverviewView: ExchangeOverviewViewUIDataSource {
    
    func objectFor(ui: ExchangeOverviewViewUI) -> ExchangeOverviewEntity {
        return object!
    }
    
    // Pass the pre-defined object to the dataSource.
}
