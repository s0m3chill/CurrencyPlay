//
//  BestRateMapRouter.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import UIKit

/// BestRateMap Module Router (aka: Wireframe)
class BestRateMapRouter: BestRateMapRouterProtocol {
    
    func start(with data: BestRateMapEntity, from navigationController: UINavigationController) {
        let presenter = BestRateMapPresenter()
        presenter.set(object: data)
        let view = BestRateMapView(presenter: presenter)
        
        navigationController.pushViewController(view, animated: true)
    }
    
}
