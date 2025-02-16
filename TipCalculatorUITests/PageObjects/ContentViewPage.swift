//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Hemanth Kumar on 16/02/25.
//

import XCTest

final class ContentViewPage {
    
    var app: XCUIApplication!

    init(app: XCUIApplication) {
        self.app = app
    }
    
    var tfBillAmount: XCUIElement {
        app.textFields["tfBillAmount"]
    }
    
    var tfTipPercent: XCUIElement {
        app.textFields["tfTipPercent"]
    }
    
}
