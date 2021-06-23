//
//  FiatPriceInfo.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2019-06-03.
//  Copyright © 2021 Breadwinner AG. All rights reserved.
//
//  SPDX-License-Identifier: BUSL-1.1
//

import Foundation

struct FiatPriceInfo: Equatable {
    let changePercentage24Hrs: Double
    let change24Hrs: Double
    let price: Double
}
