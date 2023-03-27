//
//  CalculatorModel.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/18.
//

import Foundation

class CalculatorModel {
    struct CalculatorStack {
        private var stack: [String] = []
        private var duplicate: [String] = []
        
        mutating func push(element: String) {
            stack.append(element)
        }
        
        mutating func pop() -> String? {
            return stack.popLast()
        }
        
        func lastElement() -> String? {
            if let last = stack.last{
                return last
            }
            return nil
        }
        
        func isEmpty() -> Bool {
            return stack.isEmpty
        }
        
        mutating func clearAll() {
            stack.removeAll()
        }
        
        mutating func duplicateStack() {
            duplicate = stack
        }
        
        func calaulate(num1: Double, num2: Double, op: String) -> Double {
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
        
        mutating func calaulateAll() {
            switch count{
            case 1 :
                break
            case 3 :
                if let number2 = Double(pop()!), let op = pop(), let number1 = Double(pop()!){
                    let answer = calaulate(num1: number1, num2: number2, op: op)
                    clearAll()
                    push(element: String(answer))
                }
            case 5 :
                if let number4 = Double(pop()!), let op2 = pop(), let number2 = Double(pop()!), let op = pop(), let number1 = Double(pop()!){
                    let number3 = calaulate(num1: number1, num2: number2, op: op)
                    let answer = calaulate(num1: number3, num2: number4, op: op2)
                    clearAll()
                    push(element: String(answer))
                }
                break
            default:
                break
            }
        }
            
        var count: Int {
            return stack.count
        }
    }
    
}
