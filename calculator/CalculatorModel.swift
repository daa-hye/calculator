//
//  CalculatorModel.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/18.
//

import Foundation

class CalculatorModel {
    
    private var numberStack = Stack<Double>()
    private var operatorStack = Stack<String>()
    
    func addElement(_ element: String) {
        if element.isDouble{
            numberStack.push(Double(element)!)
        }
        else {
            operatorStack.push(element)
        }
    }
    
    func showNumber() -> Double? {
        if let number = numberStack.pop() {
            return number
        } else {
            return nil
        }
    }
    
    func showOperator() -> String? {
        if let `operator` = operatorStack.pop() {
            return `operator`
        } else {
            return nil
        }
    }
    
    var numberCount: Int {
        return numberStack.count
    }
    
    func deleteAll() {
        numberStack.clearAll()
        operatorStack.clearAll()
    }
    
    var count: Int {
        return numberStack.count
    }
    
    func operatorPriority(_ op: String) -> Int {
        if op == "+" || op == "-" {
            return 0
        } else if op == "*" || op == "/" {
            return 1
        }
        else {
            return -1
        }
    }
    
    func operatorCompare(op1: String, op2: String) -> Bool?{
        let firstOp = operatorPriority(op1)
        let secondOp = operatorPriority(op2)
        if firstOp >= secondOp {
            return true
        } else if firstOp < secondOp {
            return false
        } else {
            return nil
        }
    }
    
    func operation(num1: Double, num2: Double, op: String) -> Double {
        switch op {
        case "+" :
            return num1 + num2
        case "-" :
            return num1 - num2
        case "*" :
            return num1 * num2
        case "/" :
            return num1 / num2
        default :
            return 0
        }
    }
    
    func calaulate() {
        
    }
    
    func calaulateAll() {

    }    
}


