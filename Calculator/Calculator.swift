//
//  Calculator.swift
//  Calculator
//
//  Created by Rodrigo Lourenço on 08/12/21.
//

import Foundation

enum Operation {
    case sum
    case sub
    case div
    case mult
    case none
}

final class Calculator{
    
    var runningNumber: String = ""
    var leftNumber: String = ""
    var rightNumber: String = ""
    var result: String = ""
    
    var currentOperation: Operation = .none
    
    func tapped(number: Int) {
        runningNumber += "\(number)"
    }
    
    func tapped(operation: Operation) {
        
        if currentOperation != .none {
            
            rightNumber = runningNumber
            runningNumber = ""
            
            switch currentOperation {
                case .sum:
                    result = "\(Double(leftNumber)! + Double(rightNumber)!)"
                case .sub:
                    result = "\(Double(leftNumber)! - Double(rightNumber)!)"
                case .div:
                    result = "\(Double(leftNumber)! / Double(rightNumber)!)"
                case .mult:
                    result = "\(Double(leftNumber)! * Double(rightNumber)!)"
                case .none:
                    break
            }
            
            leftNumber = result
            if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                result = "\(Int(Double(result)!))"
            }
        }else{
            leftNumber = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func finish() {
        
        self.tapped(operation: currentOperation)
        
        leftNumber = result
        rightNumber = ""
        runningNumber = result
        currentOperation = .none
    }
    
    func clean() {
        
        result = "0"
        leftNumber = "0"
        rightNumber = "0"
        runningNumber = ""
        currentOperation = .none
    }
}
