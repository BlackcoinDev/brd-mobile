//
//  DefaultCurrencyTests.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2017-04-06.
//  Copyright © 2021 Breadwinner AG. All rights reserved.
//
//  SPDX-License-Identifier: BUSL-1.1
//

import XCTest
@testable import breadwallet

class DefaultCurrencyTests : XCTestCase {

    override func setUp() {
        UserDefaults.standard.removeObject(forKey: "defaultcurrency")
    }

    func testInitialValue() {
        guard let localCurrency = Locale.current.currencyCode else {
            XCTFail("We should have a local currency")
            return
        }
        XCTAssertTrue(localCurrency == UserDefaults.defaultCurrencyCode, "Default currency should be equal to the local currency by default")
    }

    func testUpdate() {
        UserDefaults.defaultCurrencyCode = "EUR"
        XCTAssertTrue(UserDefaults.defaultCurrencyCode == "EUR", "Default currency should update.")
    }

    func testAction() {
        UserDefaults.defaultCurrencyCode = "USD"
        Store.perform(action: DefaultCurrency.SetDefault("CAD"))
        XCTAssertTrue(UserDefaults.defaultCurrencyCode == "CAD", "Actions should persist new value")
    }
    
    func testUnsupported() {
        UserDefaults.defaultCurrencyCode = "AAA"
        XCTAssertTrue(UserDefaults.defaultCurrencyCode == "USD", "USD should be default for unsupported codes")
    }
    
    func testUnsupportedAction() {
        UserDefaults.defaultCurrencyCode = "USD"
        Store.perform(action: DefaultCurrency.SetDefault("AAA"))
        XCTAssertTrue(UserDefaults.defaultCurrencyCode == "USD", "USD should be default for unsupported codes")
    }
    
}
