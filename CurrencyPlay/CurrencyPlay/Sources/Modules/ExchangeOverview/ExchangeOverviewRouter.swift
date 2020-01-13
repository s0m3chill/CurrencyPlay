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
    
    static func createInitialModule() -> UIViewController {
        let view = ExchangeOverviewView()
        return UINavigationController(rootViewController: view)
    }
    
    func showDetailsFor(object: ExchangeOverviewEntity.BankCurrencyInfo,
                        parentViewController viewController: ExchangeOverviewViewProtocol) {
        guard let rootScene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let rootNavigation = rootScene.window?.rootViewController as? UINavigationController
        else {
            fatalError("Initial scene not set")
        }
        
        
    }
        
}
