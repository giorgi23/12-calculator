//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Giorgi Jashiashvili on 5/2/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    func calculate (button: String?, displayText: String) -> String? {
        
        
        guard let numberOnDisplay = Double(displayText) else {
            fatalError("couldn't convert display label string to Double")
        }
        
        if button == "+/-" {
            
            return String(numberOnDisplay * -1)
        }
        if button == "AC" {
            return "0"
        }
        
        if button == "%" {
            
            return String(numberOnDisplay / 100)
        }
        return nil
    }
    
}
