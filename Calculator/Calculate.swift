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
    var storeNumber1: Int
    var storeNumber2: Int
    var storeNumber3: Int
    
    mutating func displayString(_ number: String) {
        display += "\(number)"
        storeNumber3 = Int(display)!
        }
    
    mutating func storeFirstNum(_ display: String) {
        if !display.isEmpty {
        storeNumber1 = Int(display)!
        }
    }
    
    mutating func storeSecondNum(_ display: String) {
        storeNumber2 = Int(display)!
    }
    
    mutating func displayAnswer(_ storeNumber1: Int) {
        display = String(storeNumber1)
    }
    
    mutating func changeSign(_ display: String) {
        storeNumber3 -= (storeNumber3 * 2)
        self.display = String(storeNumber3)
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
