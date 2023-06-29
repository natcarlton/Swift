//
//  ViewController.swift
//  Calc01-nancarl
//
//  Natasha Carlton, 1/22/23
//  nancarl@iu.edu
//  Homework 01 - C323 / Spring 2023 //

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calc01Display: UILabel!
    var isBinaryNumberBeingEntered: Bool = false
    var clearText: Bool = false
    var theModel = Calc01Model()
    
    @IBAction func pressed01Digit(_ sender: UIButton) {
        if (clearText) {
            self.calc01Display.text! = ""
            clearText = false
        }
        let digit = sender.titleLabel!.text
        
        self.calc01Display.text! += digit!
    }
    
    @IBAction func selectedOperation(_ sender: UIButton) {
        // if it is the first binary number, we know with the isBinaryNumberBeingEntered flag being false, originally the binaryNumberBeingEntered but adding is makes it a better name for a boolean
        if (!isBinaryNumberBeingEntered) {
            theModel.setOperation(newOperation: sender.titleLabel!.text!)
            // set the first operand because we just typed an operator that isn't the equals sign so we know we are still on the first operand
            theModel.setFirstOperand(newFirstOperand: self.calc01Display.text!)
            // first number has been entered
            isBinaryNumberBeingEntered = true
            // reset the label text
            self.calc01Display.text = "0"
            // reset the +/- sign variable
            
        // if the operator is the equals sign
        } else {
            // if there is an operator then we can preform a calculation
            if (theModel.operation != ""){
            // set the second operand
                theModel.setSecondOperand(newSecondOperand: self.calc01Display.text!)
            // perform the calculation and set the label text
            let computation = theModel.performOperation()
                self.calc01Display.text = computation
                // second number has been entered, so we go back to the first after the equals sign
                isBinaryNumberBeingEntered = false
                clearText = true
            }
        }
    }
    
    @IBAction func memoryOperations(_ sender: UIButton) {
        theModel.setMemoryOperation(newOperation: sender.titleLabel!.text!)
        let memory = theModel.memoryOperations(currentNum: self.calc01Display.text!)
        
        if (memory != nil) {
            self.calc01Display.text! = memory!
        }
    }
    
    // I don't know a better name for the buttons that can be used whenever as opposed to the operation signs
    @IBAction func functionButtons(_ sender: UIButton) {
        // if it is the first binary number, we know with the isBinaryNumberBeingEntered flag being false, originally the binaryNumberBeingEntered but adding is makes it a better name for a boolean
        if (!isBinaryNumberBeingEntered) {
            theModel.setFirstOperand(newFirstOperand: self.calc01Display.text!)
            theModel.setFunctionOperation(newOperation: sender.titleLabel!.text!)
            // for the negative zero to turn back to positive zero...
            var newOperand: String
            if (self.calc01Display.text! == "-0") {
                newOperand = "0"
            } else {
                newOperand = theModel.functionButtons()
            }
            // function button returns the new text to display
            self.calc01Display.text! = newOperand
        } else {
            theModel.setSecondOperand(newSecondOperand: self.calc01Display.text!)
            theModel.setFunctionOperation(newOperation: sender.titleLabel!.text!)
            // function button returns the new text to display
            var newOperand: String
            if (self.calc01Display.text! == "-0") {
                newOperand = "0"
            } else {
                newOperand = theModel.functionButtons()
            }
            // if you hit the AC button, an empty string is returned
            if (newOperand == "") {
                isBinaryNumberBeingEntered = false
            }
            self.calc01Display.text! = newOperand
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

