//
//  ReferenceiOSUITests.swift
//  ReferenceiOSUITests
//
//  Created by Dunya Kirkali on 27/03/2019.
//  Copyright © 2019 ABN AMRO. All rights reserved.
//

import XCTest

class ReferenceiOSUITests: BaseTestCase {
    private var mainScreen = MainScreen()
    
    override func setUp() {
        super.setUp()
    }

    /*
     AC - Verify main screen elements are present - Home label and Button
     */
    func testGenerate_verifyMainScreenElements() {
        mainScreen.verifyMainScreenElementsPresent()
    }
    
    /*
    AC - Verify amount is visible as soon as Button is pressed
    */
    func testGenerate_verifyAmountPresent() {
        mainScreen.verifyMainScreenElementsPresent()
            .tapOnButton()
            .verifyAmountPresent()
    }
    
    /*
    AC - Verify amount is within the bounds 100, 99999999
    */
    func testGenerate_verifyAmountBounds() {
        mainScreen.verifyMainScreenElementsPresent()
            .tapOnButton()
            .verifyMainScreenElementsPresent()
            .verifyBoundaryValues()
    }
}
