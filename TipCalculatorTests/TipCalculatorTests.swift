//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Hemanth Kumar on 15/02/25.
//

import XCTest
@testable import TipCalculator

final class when_calculating_tip_based_on_total_amount: XCTestCase {
    
    var tipCalculator : TipCalculator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tipCalculator = TipCalculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tipCalculator = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_should_calculate_tip_successfully() {
        let tip = try! tipCalculator.calculate(total: 100, tipPercentage: 20)
        XCTAssertEqual(tip, 20)
    }
    
    func test_should_throw_error_when_total_is_negative() {
        XCTAssertThrowsError(try tipCalculator.calculate(total: -10, tipPercentage: 20), "") { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidAmount)
        }
    }
    
    func test_should_throw_error_when_tip_percentage_is_not_in_range() {
        XCTAssertThrowsError(try tipCalculator.calculate(total: 100, tipPercentage: 120), "") { error in
            XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidTipPercentage)
        }
    }

}

