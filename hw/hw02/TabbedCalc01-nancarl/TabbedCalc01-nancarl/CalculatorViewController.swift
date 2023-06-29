//
//  CalculatorViewController.swift
//  TabbedCalc01-nancarl
//
//  Natasha Carlton, 2/7/23
//  nancarl@iu.edu
//  Homework 01 - C323 / Spring 2023 //

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var tabbedCalc01Display: UILabel!
    var isBinaryNumberBeingEntered: Bool = false
    var clearText: Bool = false
    
    var appDelegate: AppDelegate?
    var myModel: TabbedCalc01Model?
    
    @IBAction func pressed01Digit(_ sender: UIButton) {
        if (clearText) {
            
            self.tabbedCalc01Display.text! = ""
            clearText = false
        }
        let digit = sender.titleLabel!.text
        
        self.tabbedCalc01Display.text! += digit!
    }
    
    @IBAction func selectedOperation(_ sender: UIButton) {
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.myModel = currAppDelegate.theModel
        } else {
            print("Cannot unwrap the model.")
        }
        if let currModel = self.myModel {
            
            // if it is the first binary number, we know with the isBinaryNumberBeingEntered flag being false, originally the binaryNumberBeingEntered but adding is makes it a better name for a boolean
            if (!isBinaryNumberBeingEntered) {
                currModel.setOperation(newOperation: sender.titleLabel!.text!)
                // set the first operand because we just typed an operator that isn't the equals sign so we know we are still on the first operand
                currModel.setFirstOperand(newFirstOperand: self.tabbedCalc01Display.text!)
                // first number has been entered
                isBinaryNumberBeingEntered = true
                // reset the label text
                self.tabbedCalc01Display.text = "0"
                // reset the +/- sign variable
                
                // if the operator is the equals sign
            } else {
                // if there is an operator then we can preform a calculation
                if (currModel.operation != ""){
                    // set the second operand
                    currModel.setSecondOperand(newSecondOperand: self.tabbedCalc01Display.text!)
                    // perform the calculation and set the label text
                    let computation = currModel.performOperation()
                    self.tabbedCalc01Display.text = computation
                    // second number has been entered, so we go back to the first after the equals sign
                    isBinaryNumberBeingEntered = false
                    clearText = true
                }
            }
            
        } else {
            print("Cannot unwrap the model.")
        }
    }
    
    @IBAction func memoryOperations(_ sender: UIButton) {
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.myModel = currAppDelegate.theModel
        } else {
            print("Cannot unwrap the model.")
        }
        if let currModel = self.myModel {
            currModel.setMemoryOperation(newOperation: sender.titleLabel!.text!)
            let memory = currModel.memoryOperations(currentNum: self.tabbedCalc01Display.text!)
            
            if (memory != nil) {
                self.tabbedCalc01Display.text! = memory!
            }
        } else {
            print("Cannot unwrap the model.")
        }
    }
    
    // I don't know a better name for the buttons that can be used whenever as opposed to the operation signs
    @IBAction func functionButtons(_ sender: UIButton) {
        if let currAppDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.myModel = currAppDelegate.theModel
        } else {
            print("Cannot unwrap the model.")
        }
        if let currModel = self.myModel {
            // if it is the first binary number, we know with the isBinaryNumberBeingEntered flag being false, originally the binaryNumberBeingEntered but adding is makes it a better name for a boolean
            if (!isBinaryNumberBeingEntered) {
                currModel.setFirstOperand(newFirstOperand: self.tabbedCalc01Display.text!)
                currModel.setFunctionOperation(newOperation: sender.titleLabel!.text!)
                // for the negative zero to turn back to positive zero...
                var newOperand: String
                if (self.tabbedCalc01Display.text! == "-0") {
                    newOperand = "0"
                } else {
                    newOperand = currModel.functionButtons()
                }
                // function button returns the new text to display
                self.tabbedCalc01Display.text! = newOperand
            } else {
                currModel.setSecondOperand(newSecondOperand: self.tabbedCalc01Display.text!)
                currModel.setFunctionOperation(newOperation: sender.titleLabel!.text!)
                // function button returns the new text to display
                var newOperand: String
                if (self.tabbedCalc01Display.text! == "-0") {
                    newOperand = "0"
                } else {
                    newOperand = currModel.functionButtons()
                }
                // if you hit the AC button, an empty string is returned
                if (newOperand == "") {
                    isBinaryNumberBeingEntered = false
                }
                self.tabbedCalc01Display.text! = newOperand
            }
        } else {
            print("Cannot unwrap the model.")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

