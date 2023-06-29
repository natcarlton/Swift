//
//  Calc01Model.swift
//  Calc01-nancarl
//
//  Natasha Carlton, 1/22/23
//  nancarl@iu.edu
//  Homework 01 - C323 / Spring 2023 //

import Foundation


class Calc01Model {
    var firstOperand: Int
    var secondOperand: Int
    var memory: Int
    var operation: String
    var functionOperation: String
    var memoryOperation: String
    
    init() {
        self.firstOperand = 0
        self.secondOperand = 0
        self.memory = 0
        self.operation = ""
        self.functionOperation = ""
        self.memoryOperation = ""
    }
    
    func binaryToDecimal(binaryString: String) -> Int {
        var decimalNum = 0
        var exponent = 0.0
        
        for (char) in binaryString.reversed() {
            if (char == "1") {
                let value = pow(2.0, exponent)
                decimalNum += Int(value)
            }  
            exponent += 1
        }
        
        if (binaryString.first == "-") {
            decimalNum *= -1
        }

        return decimalNum
    }
    
    func decimalToBinary(decimalNum: Int) -> String {
        var mutableDecimal: Int
        var isPositive = true
        if (decimalNum >= 0) {
            mutableDecimal = decimalNum
        } else {
            mutableDecimal = decimalNum * -1
            isPositive = false
        }
         
        var binaryString = ""
        
        while(mutableDecimal != 0){
           let binaryNum = mutableDecimal % 2
           
            binaryString = String(binaryNum) + binaryString
    
            mutableDecimal /= 2
        }
        
        if (!isPositive) {
            binaryString = "-" + binaryString
        }
        // if the binary string is 0, the while loop above will never run
        if (binaryString == "") {
            binaryString = "0"
        }
    
        return binaryString
    }
    
    func setFirstOperand(newFirstOperand: String) {
        // convert from binary to a number
        self.firstOperand = binaryToDecimal(binaryString: newFirstOperand)
    }
    
    func setSecondOperand(newSecondOperand: String) {
        // convert from binary to a number
        self.secondOperand = binaryToDecimal(binaryString: newSecondOperand)
    }
    
    func setMemory(newMemory: Int) {
        // convert from binary to a number
        self.memory = newMemory
    }
    
    func setOperation(newOperation: String) {
        self.operation = newOperation
    }
    
    func setFunctionOperation(newOperation: String) {
        self.functionOperation = newOperation
    }
    
    func setMemoryOperation(newOperation: String) {
        self.memoryOperation = newOperation
    }
    
    func memoryOperations(currentNum: String) -> String? {
        var newMemory = ""
        if (self.memoryOperation == "m-") {
            setMemory(newMemory: self.memory - binaryToDecimal(binaryString: currentNum))
            return nil
        } else if (self.memoryOperation == "m+") {
            setMemory(newMemory: binaryToDecimal(binaryString: currentNum) + self.memory)
            return nil
        } else if (self.memoryOperation == "mr") {
            newMemory = decimalToBinary(decimalNum: self.memory)
        } else if (self.memoryOperation == "mc") {
            setMemory(newMemory: 0)
            return nil
        }
        
        return newMemory
    }
    
    func functionButtons() -> String {
        var newOperand = ""
        
        if (functionOperation == "+/-"){
            var operand: Int
            
            // no operation means it's the first number
            if (self.operation == "") {
                operand = self.firstOperand * -1
                // if the operand is 0, then *= -1 won't make it negative
                if (operand == 0) {
                    newOperand = "-0"
                } else {
                    newOperand = decimalToBinary(decimalNum: operand)
                }
                setFirstOperand(newFirstOperand: newOperand)
            } else {
                operand = self.secondOperand * -1
                // if the operand is 0, then *= -1 won't make it negative
                if (operand == 0) {
                    newOperand = "-0"
                } else {
                    newOperand = decimalToBinary(decimalNum: operand)
                }
                setSecondOperand(newSecondOperand: newOperand)
            }
        } else if (functionOperation == "AC") {
            setFirstOperand(newFirstOperand: "0")
            setSecondOperand(newSecondOperand: "0")
            setOperation(newOperation: "")
        }
        
        return newOperand
    }
    
    func performOperation() -> String {
        var computation = 0
        
        if (operation == "+") {
            computation = self.firstOperand + self.secondOperand
        } else if (operation == "-") {
            computation = self.firstOperand - self.secondOperand
        } else if (operation == "x") {
            computation = self.firstOperand * self.secondOperand
        } else if (operation == "÷") {
            if (secondOperand != 0) {
                computation = self.firstOperand / self.secondOperand
            } else {
                return "ERROR"
            }
        } else if (operation == "AC") {
            return ""
        }
        setFirstOperand(newFirstOperand: "")
        setSecondOperand(newSecondOperand: "")
        setOperation(newOperation: "")
        return decimalToBinary(decimalNum: computation)
    }
}
