//
//  BestRateMapEntity.swift
//  CurrencyPlay
//
//  Created Dariy Kordiyak on 13.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import CoreLocation

/// BestRateMap Module Entity
struct BestRateMapEntity {
    let selectedExchange: ExchangeOverviewEntity.BankCurrencyInfo
    let bestExchange: ExchangeOverviewEntity.BankCurrencyInfo
}

struct ExchangeCoordinates {
    let selected: CLLocationCoordinate2D
    let best: CLLocationCoordinate2D
}
