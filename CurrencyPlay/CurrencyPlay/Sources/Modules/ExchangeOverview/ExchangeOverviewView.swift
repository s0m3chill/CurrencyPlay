//
//  ExchangeOverviewView.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// MARK: ExchangeOverviewViewUI Data Source -
///// ExchangeOverviewViewUI Data Source
protocol ExchangeOverviewViewDataSource: class {
    func sectionsCount() -> Int
    func rowsCount() -> Int
    func title(for row: Int) -> String
}

/// ExchangeOverview Module View
class ExchangeOverviewView: UIViewController {
    
    private typealias Presenter = (ExchangeOverviewPresenterProtocol & ExchangeOverviewViewDataSource)
    
    private var ui: ExchangeOverviewUIInput!
    private var presenter: Presenter!
        
    override func loadView() {
        ui = ExchangeOverviewViewUI(delegate: self)
        presenter = ExchangeOverviewPresenter(view: self)
        ui.setupUIElements()
        
        view = ui
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending ExchangeOverviewView to implement it's protocol
extension ExchangeOverviewView: ExchangeOverviewViewInput {
    
    func reloadData() {
        ui.reloadData()
    }
    
}

extension ExchangeOverviewView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.sectionsCount()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = presenter.title(for: indexPath.row)
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension ExchangeOverviewView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.view(self, didSelectRow: indexPath.row)
    }
    
}
