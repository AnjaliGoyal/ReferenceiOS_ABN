//
//  MainScreen.swift
//  ReferenceiOSUITests
//
//  Created by Anjali Goyal on 14/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//

import XCTest
@testable import ReferenceiOS

class MainScreen: XCTestCase {
    
    // MARK: ELEMENTS SELECTORS:
    private lazy var helloLabel = BaseTestCase.app.staticTexts[Identifiers.HomePage.homeLabel]
    private lazy var buttonButton = BaseTestCase.app.buttons["Button"]
    private lazy var pickerWheels = BaseTestCase.app.staticTexts.pickerWheels

    // MARK: VERIFICATION METHODS:
    
    @discardableResult
    func verifyMainScreenElementsPresent() -> MainScreen {
        XCTAssert(helloLabel.exists)
        XCTAssert(buttonButton.exists)
        return self
    }
    
    @discardableResult
    func verifyAmountPresent() -> MainScreen {
        XCTAssert(helloLabel.exists)
        helloLabel.label.contains("€")
        return self
    }
    
    @discardableResult
    func verifyBoundaryValues() -> MainScreen {
        XCTAssert(helloLabel.exists)
        let label = helloLabel.label
        let amountlabel = prepareString(amount: label)
        let amount = convertToDouble(amount: amountlabel)

        if (amount ?? Double(200) > Double(100) && amount ?? Double(200) < Double(99999999)){
            print("Valid amount, within the range")
        }
        else
        {
            print("Amount outside bounds (100, 99999999)")
        }
        return self
    }
    
    
    // MARK: ACTION METHODS:
    @discardableResult
    func tapOnButton() -> MainScreen {
        XCTAssert(buttonButton.exists)
        buttonButton.tap()
        return self
    }
    
    @discardableResult
    func convertToDouble(amount: String) -> Double? {
        let num = (amount as NSString).doubleValue
        return num
    }
    
    @discardableResult
    func prepareString(amount: String) -> String {
        let index = amount.index(amount.startIndex, offsetBy: 2)
        let removeCurrency = amount.suffix(from: index)
        
        let conv1 = removeCurrency.replacingOccurrences(of: ".", with: "")
        let conv2 = conv1.replacingOccurrences(of: ",", with: ".")
        return conv2
    }
    
}
