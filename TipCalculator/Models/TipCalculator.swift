//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Hemanth Kumar on 15/02/25.
//

import Foundation

enum TipCalculatorError: Error {
    case invalidAmount
    case invalidTipPercentage
}

class TipCalculator {
    
    func calculate(total: Double, tipPercentage: Double) throws -> Double {
        
        if total < 0 {
            throw TipCalculatorError.invalidAmount
        }
        
        if tipPercentage < 0 || tipPercentage > 100 {
            throw TipCalculatorError.invalidTipPercentage
        }
        
        return (total * tipPercentage)/100
    }
    
}
