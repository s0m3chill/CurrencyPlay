//
//  ExchangeListViewController.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 29.12.2019.
//  Copyright © 2019 Dariy Kordiyak. All rights reserved.
//

import UIKit

class ExchangeListViewController: UIViewController {
    
    let privatProvider = PrivatBankService()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .white
    }

}

