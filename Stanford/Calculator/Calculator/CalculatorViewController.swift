//
//  ViewController.swift
//  Calculator
//
//  Created by Sharad Paghadal on 07/01/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var displayBar: UILabel!
    
    private var userInBetweenCheck = false
    
    @IBAction private func digitBtnClicked(_ sender: UIButton) {
        
        if userInBetweenCheck{
            self.displayBar.text = self.displayBar.text! + sender.currentTitle!
        }else{
            self.displayBar.text = sender.currentTitle!
        }
        userInBetweenCheck = true
    }
    private var displayValue : Double {
        set {
            self.displayBar.text = String(newValue)
        }
        get{
            return Double(displayBar.text!)!
        }
    }
    
    var brain = calculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        
        if userInBetweenCheck {
            brain.setOperand(operand: displayValue )
            userInBetweenCheck = false
        }
        
        if let mathematicalSymbol = sender.currentTitle{
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
    var savedProgram : calculatorBrain.propertyList?
    
    @IBAction func saveBtnClicked() {
        savedProgram = brain.program
    }
    
    @IBAction func restoreBtnClicked() {
        if savedProgram != nil{
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
}

