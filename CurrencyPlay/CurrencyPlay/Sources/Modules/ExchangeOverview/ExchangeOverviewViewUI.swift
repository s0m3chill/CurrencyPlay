//
//  ExchangeOverviewViewUI.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

class ExchangeOverviewViewUI: UIView {
    
    typealias Container = UITableViewDataSource & UITableViewDelegate
    
    private weak var delegate: Container?
    private lazy var tableView: UITableView = {
        let ret = UITableView()
        ret.translatesAutoresizingMaskIntoConstraints = false
        
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

extension ExchangeOverviewViewUI: ExchangeOverviewUIInput {
    
    func setupUIElements() {
        backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        tableView.delegate = delegate
        tableView.dataSource = delegate
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}
