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
    var x: Double = 0
    var y: Double = 0
    var operationSign: String = ""
    
    var currentInput: Double  {
        get {
            return Double(firstLabel.text!)!
        }
        set {
            firstLabel.text	= "\(newValue)"
            stillTyping = false
        }
    }
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    


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
        }
    
    func operateWithTwoOperands (operation: (Double, Double) -> Double) {
        currentInput = operation (x, y)
        stillTyping = false
    }
    
    @IBAction func result(_ sender: UIButton) {
        if stillTyping {
            y = currentInput
        }
        
        switch operationSign {
            case "+":
                operateWithTwoOperands{$0 + $1}
            case "-":
                operateWithTwoOperands{$0 - $1}
            case "✕":
                operateWithTwoOperands{$0 + $1}
            case "∕":
                operateWithTwoOperands{$0 + $1}
        default: break
        }
    }
    
    


    
    
    
}
