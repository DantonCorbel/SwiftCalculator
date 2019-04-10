//
//  Calculate.swift
//  Calculator
//
//  Created by Deb Santa Clara on 8/04/19.
//  Copyright © 2019 Deb Santa Clara. All rights reserved.
//

import Foundation

struct Numbers {
    var display: String
    var storeNumber1: Double
    var storeNumber2: Double
    var storeNumber3: Double
    
    mutating func displayString(_ number: String) {
        display += "\(number)"
        storeNumber3 = Double(display)!
        }
    
    mutating func storeFirstNum(_ display: String) {
        if !display.isEmpty {
        storeNumber1 = Double(display)!
        }
    }
    
    mutating func storeSecondNum(_ display: String) {
        storeNumber2 = Double(display)!    }
    
    mutating func displayAnswer(_ storeNumber1: Double) {
        display = String(storeNumber1)
    }
    
    mutating func changeSign(_ display: String) {
        storeNumber3 -= (storeNumber3 * 2)
        self.display = String(storeNumber3)
    }
    
    mutating func percent(_ storeNumber3: Double) {
        self.storeNumber3 = storeNumber3 / 100
        display = String(self.storeNumber3)
    }
}

enum Signs {
    case add, subtract, multiply, divide
    
    var signString: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "x"
        case .divide:
            return "÷"
        }
    }
}

enum specialSigns {
    case AC, percent, plusMinus
}
