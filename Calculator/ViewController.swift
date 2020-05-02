//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var storedValue : String = ""
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        
        guard let numberOnDisplay = Double(displayLabel.text!) else {
            fatalError("couldn't convert display label string to Double")
        }
        
        if sender.currentTitle == "+/-" {
            
            displayLabel.text = String(numberOnDisplay * -1)
        }
        
        if sender.currentTitle == "AC" {
            displayLabel.text = "0"
        }
        
        if sender.currentTitle == "%" {
            
            displayLabel.text = String(numberOnDisplay / 100)
        }
        
        storedValue = ""
    
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if (sender.currentTitle == "." && storedValue.contains("."))  {
            return
            
        }
        
        if let numValue = sender.currentTitle {

            displayLabel.text = storedValue + numValue
            storedValue.append(numValue)


        }
    
    }

}

