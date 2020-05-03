import UIKit

class ViewController: UIViewController {
    
    private var typedNumber : String = ""
    private var storedNumber : Double?
    private var storedAction : String?
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        typedNumber = ""
        
        guard let numberOnDisplay = Double(displayLabel.text!) else {
            fatalError("couldn't convert display label string to Double")
        }
        
        func calculation () {
            switch storedAction {
            case "+":
                storedNumber! += numberOnDisplay
            case "-":
                storedNumber! -= numberOnDisplay
            case "×":
                storedNumber! *= numberOnDisplay
            case "÷":
                storedNumber! /= numberOnDisplay
            default:
                displayLabel.text = "0.0"
            }
        }

        if sender.currentTitle == "=" {
            calculation()
        }
        
        storedAction = sender.currentTitle
        
        if storedNumber == nil {
            storedNumber = numberOnDisplay
        } else {
            calculation()
        }
        //unwrapping the optional to put in the label
        if let storedNumber = storedNumber {
            displayLabel.text = String(storedNumber)
        }
        
        if sender.currentTitle == "%" {
            displayLabel.text = String(numberOnDisplay / 100)
        } else if sender.currentTitle == "+/-" {
            displayLabel.text = String(numberOnDisplay * -1)
        } else if sender.currentTitle == "AC" {
            displayLabel.text = "0.0"
            storedAction = nil
            storedNumber = nil
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if (sender.currentTitle == "." && typedNumber.contains("."))  {
            return
        }
        
        if let numValue = sender.currentTitle {
            displayLabel.text = typedNumber + numValue
            typedNumber.append(numValue)
        }
    
    }

}

