//
//  BaseTestCase.swift
//  ReferenceiOSUITests
//
//  Created by Anjali Goyal on 14/08/2022.
//  Copyright © 2022 ABN AMRO. All rights reserved.
//

import XCTest

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        BaseTestCase.app.launch()
    }
    
    override func tearDown() {
        XCUIApplication().terminate()
        super.tearDown()
    }
    
    static var app: XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["UITest"]
        return app
    }
}
