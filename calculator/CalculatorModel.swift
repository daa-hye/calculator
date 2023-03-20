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
        
        mutating func push(element: String) {
            stack.append(element)
        }
        
        mutating func pop() -> String? {
            return stack.popLast()
        }
        
        func isOperator() -> Bool {
            let last = stack.last
            return last == "+" || last == "-" || last == "*" || last == "/"
        }
        
        func isEmpty() -> Bool {
            return stack.isEmpty
        }
        
        mutating func clearAll(){
            stack.removeAll()
        }
            
        var count: Int {
            return stack.count
        }
    }
    
}