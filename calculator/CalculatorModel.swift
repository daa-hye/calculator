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
    
    func showOperator() -> String? {
        if let `operator` = operatorStack.lastElement() {
            return `operator`
        } else {
            return nil
        }
    }
    
    var numberCount: Int {
        return numberStack.count
    }
    
    var numberOperator: Int {
        return operatorStack.count
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
            return false
        } else if firstOp < secondOp {
            return true
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
    
    func calaulate() -> String? {
        guard let num2 = numberStack.pop(),
              let num1 = numberStack.pop(),
              let op = operatorStack.pop() else { return nil }
        
        let answer = operation(num1: num1, num2: num2, op: op)
        numberStack.push(answer)
        return String(answer)
    }
    
    func calaulateAll() -> String? {
        guard numberOperator != 1 else { return calaulate() }
        var numberList = Array<Double>()
        var operatorList = Array<String>()
        
        while !numberStack.isEmpty() {
            guard let number = numberStack.pop() else { return nil }
            numberList.append(number)
        }
        
        while !operatorStack.isEmpty() {
            guard let `operator` = operatorStack.pop() else { return nil }
            operatorList.append(`operator`)
        }
        
        var answer: Double
        
        if operatorCompare(op1: operatorList[0], op2: operatorList[1])! {
            let temp = operation(num1: numberList[1], num2: numberList[2], op: operatorList[1])
            answer = operation(num1: numberList[0], num2: temp, op: operatorList[0])
        }
        else {
            let temp = operation(num1: numberList[0], num2: numberList[1], op: operatorList[0])
            answer = operation(num1: temp, num2: numberList[2], op: operatorList[1])
        }
        numberStack.push(answer)
        return String(answer)
    }    
}


