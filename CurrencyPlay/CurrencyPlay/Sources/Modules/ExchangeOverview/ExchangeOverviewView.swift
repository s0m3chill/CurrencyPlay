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
    
    private typealias Presenter = (ExchangeOverviewPresenterProtocol & ExchangeOverviewViewUIDataSource)
    
    private let ui = ExchangeOverviewViewUI()
    private var presenter: Presenter!
        
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
    }
    
}

// MARK: - extending ExchangeOverviewView to implement it's protocol
extension ExchangeOverviewView: ExchangeOverviewViewProtocol {
    
    func reloadData() {
        ui.reloadData()
    }
    
}

// MARK: - extending ExchangeOverviewView to implement the custom ui view delegate
extension ExchangeOverviewView: ExchangeOverviewViewUIDelegate {
    
    func view(_ view: ExchangeOverviewViewUI, didSelectRow at: Int) {
        presenter.view(self, didSelectRow: at)
    }
     
}

// MARK: - extending ExchangeOverviewView to implement the custom ui view data source
extension ExchangeOverviewView: ExchangeOverviewViewUIDataSource {
    
    func sectionsCount() -> Int {
        return presenter.sectionsCount()
    }
    
    func rowsCount() -> Int {
        return presenter.rowsCount()
    }
    
    func title(for row: Int) -> String {
        return presenter.title(for: row)
    }
    
}
