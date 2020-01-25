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
    
    static func createModule(with data: BestRateMapEntity) -> UIViewController {
        let presenter = BestRateMapPresenter()
        presenter.set(object: data)
        let view = BestRateMapView(presenter: presenter)
        
        return view
    }
    
}
