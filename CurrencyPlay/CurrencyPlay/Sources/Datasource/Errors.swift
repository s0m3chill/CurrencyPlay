//
//  Errors.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 06.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation

enum FetchErrors: Error {
    case privatCurrencyNoUsd
    case addressNotGeocoded
}
