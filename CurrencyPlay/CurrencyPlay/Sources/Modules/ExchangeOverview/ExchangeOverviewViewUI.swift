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
    func view(_ view: ExchangeOverviewViewUI, didSelectRow at: Int)
}

// MARK: ExchangeOverviewViewUI Data Source -
/// ExchangeOverviewViewUI Data Source
protocol ExchangeOverviewViewUIDataSource {
    func sectionsCount() -> Int
    func rowsCount() -> Int
    func title(for row: Int) -> String
}

class ExchangeOverviewViewUI: UIView {
    
    var delegate: ExchangeOverviewViewUIDelegate?
    var dataSource: ExchangeOverviewViewUIDataSource?
        
    private lazy var tableView: UITableView = {
        let ret = UITableView()
        ret.translatesAutoresizingMaskIntoConstraints = false
        ret.dataSource = self
        ret.delegate = self
        
        return ret
    }()
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        setupConstraints()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    fileprivate func setupUIElements() {
        backgroundColor = .white
    }
    
    fileprivate func setupConstraints() {
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        setupUIElements()
        tableView.reloadData()
    }
    
}

extension ExchangeOverviewViewUI: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.sectionsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.rowsCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = dataSource?.title(for: indexPath.row)
        
        return cell
    }
    
}

extension ExchangeOverviewViewUI: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.view(self, didSelectRow: indexPath.row)
    }
    
}
