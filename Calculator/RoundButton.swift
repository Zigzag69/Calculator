//
//  RoundButton.swift
//  Calculator
//
//  Created by Admin on 12.02.18.
//  Copyright © 2018 Ivan Heveliev. All rights reserved.
//

import UIKit

    @IBDesignable
    class RoundButton: UIButton {
        
        @IBInspectable var roundButton: Bool = false {
            didSet {
                if roundButton {
                    layer.cornerRadius = frame.height / 2
                }
            }
        }

        override func prepareForInterfaceBuilder() {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
}
