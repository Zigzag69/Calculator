//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 11.02.18.
//  Copyright © 2018 Ivan Heveliev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    var stillTyping = false
    var dotCheck = false
    var x: Double = 0
    var y: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double  {
        get {
            return Double(firstLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray[1] == "0" {
                firstLabel.text = "\(valueArray[0])"
            }
            else {
                firstLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    

    @IBAction func numbersBut(_ sender: UIButton) {
        let numbers = sender.currentTitle!
        
        if stillTyping {
            if (firstLabel.text?.count)! < 20 {
        firstLabel.text = firstLabel.text! + numbers
        }
      }
        else {
            firstLabel.text = numbers
            stillTyping = true
        }
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        x = currentInput
        stillTyping = false
        dotCheck = false
        }
    
    func operateWithTwoOperands (operation: (Double, Double) -> Double) {
        currentInput = operation (x, y)
        stillTyping = false
    }
    
   
    @IBAction func clear(_ sender: UIButton) {
        x = 0
        y = 0
        currentInput = 0
        firstLabel.text = "0"
        stillTyping = false
        operationSign = ""
        dotCheck = false
    }
    
    
    @IBAction func plusMinus(_ sender: UIButton) {
        currentInput = -currentInput
    }
    
    
    @IBAction func percent(_ sender: UIButton) {
        if x == 0 {
            currentInput = currentInput / 100
        }
        else {
            y = x * currentInput / 100
        }
        stillTyping = false
    }
    
    
    @IBAction func dot(_ sender: UIButton) {
        if stillTyping && !dotCheck {
            firstLabel.text = firstLabel.text! + "."
            dotCheck = true
        }
        else if !stillTyping && !dotCheck {
            firstLabel.text = "0."
        }
    }
    
    
    
    @IBAction func result(_ sender: UIButton) {
        
        if stillTyping {
            y = currentInput
        }
        
        dotCheck = false
        
        switch operationSign {
            case "+":
                operateWithTwoOperands{$0 + $1}
            case "-":
                operateWithTwoOperands{$0 - $1}
            case "✕":
                operateWithTwoOperands{$0 * $1}
            case "∕":
                operateWithTwoOperands{$0 / $1}
        default: break
        }
    }

}
