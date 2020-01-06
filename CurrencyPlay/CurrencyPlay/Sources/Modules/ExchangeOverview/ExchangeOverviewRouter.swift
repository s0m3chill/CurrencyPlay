//
//  ExchangeOverviewRouter.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// ExchangeOverview Module Router (aka: Wireframe)
class ExchangeOverviewRouter: ExchangeOverviewRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = ExchangeOverviewView()
        
        return UINavigationController(rootViewController: view)
    }
        
}
