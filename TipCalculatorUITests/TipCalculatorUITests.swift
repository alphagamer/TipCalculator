//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Hemanth Kumar on 15/02/25.
//

import XCTest

final class TipCalculatorUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        app = XCUIApplication()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }
    
    func test_textfields_placeholders() {
        XCTAssertEqual(app.textFields["tfBillAmount"].value as? String, "Enter Bill Amount")
        XCTAssertEqual(app.textFields["tfTipPercent"].value as? String, "Enter Tip Percentage")
    }
    
    func test_tip_is_displayed() {
        let tfBillAmount = app.textFields["tfBillAmount"]
        let tfTipPercent = app.textFields["tfTipPercent"]
        
        let lblTipAmount = app.staticTexts["lblTipAmount"]
        
        let btnCalculateTip = app.buttons["btnCalculateTip"]
        
        tfBillAmount.tap()
        tfBillAmount.typeText("100")
        
        tfTipPercent.tap()
        tfTipPercent.typeText("20")
        
        btnCalculateTip.tap()
        
        let _ = lblTipAmount.waitForExistence(timeout: 1)
        
        XCTAssertEqual(lblTipAmount.label, "Tip Amount : $ 20.0")
    }

}
