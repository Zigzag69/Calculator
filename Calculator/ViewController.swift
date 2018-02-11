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
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var thirdLabel: UILabel!
    


    @IBAction func numbersBut(_ sender: UIButton) {
        let numbers = sender.currentTitle!
        firstLabel.text = firstLabel.text! + numbers
    }
    
    
    
    
    


    
    
    
}
