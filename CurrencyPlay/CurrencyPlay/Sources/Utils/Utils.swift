//
//  Utils.swift
//  CurrencyPlay
//
//  Created by Dariy Kordiyak on 27.01.2020.
//  Copyright © 2020 Dariy Kordiyak. All rights reserved.
//

import Foundation

func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}
