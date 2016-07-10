//
//  ViewController.swift
//  Calculator
//
//  Created by Joseph Leiferman on 3/11/16.
//  Copyright © 2016 electricBrain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Holds display values
    @IBOutlet weak var display: UILabel!
    
    // keeps track of whether user is in the middle of typeing
    var userIsInMiddleOfText: Bool = false
    
    /** appends digit to display */
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        
        if userIsInMiddleOfText {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInMiddleOfText = true
        }
    }
    /** If CE button is pressed display is reset*/
    @IBAction func resetDisplay(sender: UIButton) {
        display.text = "0"
        userIsInMiddleOfText = false
    }
    
    @IBAction func evualteExpression() {
        let evaulate = NSExpression(format: display.text!)
        print(evaulate)
        var result = evaulate.expressionValueWithObject(nil, context: nil) as! NSNumber
        print(result)
        display.text = result.stringValue
        userIsInMiddleOfText = false
    }
}

