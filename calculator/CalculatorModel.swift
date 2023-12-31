//
//  CalculatorModel.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/18.
//

import Foundation

class CalculatorModel {

    private var numberBuffer = [String]()
    private var operatorBuffer = [String]()
    private var numberStack = Stack<Double>()
    private var operatorStack = Stack<String>()

    func appendNumber(_ element: String) {
        numberBuffer.append(element)
    }

    func appendOperator(_ element: String) {
        operatorBuffer.append(element)
    }

    func showOutputLabel() -> String {
        return numberBuffer.reduce("", { $0.appending($1) })
    }

    func showNegative() -> String {
        return ""
    }

    func showPercent() -> String {
        guard let show = Double(numberBuffer.reduce("", { $0.appending($1) })) else { return "" }
        return String(show / 100.0)
    }

    func clearBuffer() {
        numberBuffer.removeAll()
        operatorBuffer.removeAll()
    }

    func pushNumber() {
        if let element = Double(showOutputLabel()) {
            numberStack.push(element)
        }
    }

    func pushOperator() {
        if let element = numberBuffer.first {
            operatorStack.push(element)
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

    func operatorPriority(_ operator: String) -> Int {
        if `operator` == "+" || `operator` == "-" {
            return 0
        } else if `operator` == "*" || `operator` == "/" {
            return 1
        } else {
            return -1
        }
    }

    func operatorCompare(operator1: String, operator2: String) -> Bool? {
        let firstOp = operatorPriority(operator1)
        let secondOp = operatorPriority(operator2)
        if firstOp >= secondOp {
            return false
        } else if firstOp < secondOp {
            return true
        } else {
            return nil
        }
    }

    func operation(num1: Double, num2: Double, operator: String) -> Double {
        switch `operator` {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default:
            return 0
        }
    }

    func calaulate() -> String? {
        guard let num2 = numberStack.pop(),
              let num1 = numberStack.pop(),
              let `operator` = operatorStack.pop() else { return nil }

        let answer = operation(num1: num1, num2: num2, operator: `operator`)
        numberStack.push(answer)
        return String(answer)
    }

    func calaulateAll() -> String? {
        guard numberOperator != 1 else { return calaulate() }
        var numberList = [Double]()
        var operatorList = [String]()

        while !numberStack.isEmpty() {
            guard let number = numberStack.pop() else { return nil }
            numberList.append(number)
        }

        while !operatorStack.isEmpty() {
            guard let `operator` = operatorStack.pop() else { return nil }
            operatorList.append(`operator`)
        }

        var answer: Double

        if operatorCompare(operator1: operatorList[0], operator2: operatorList[1])! {
            let temp = operation(num1: numberList[1], num2: numberList[2], operator: operatorList[1])
            answer = operation(num1: numberList[0], num2: temp, operator: operatorList[0])
        } else {
            let temp = operation(num1: numberList[0], num2: numberList[1], operator: operatorList[0])
            answer = operation(num1: temp, num2: numberList[2], operator: operatorList[1])
        }
        numberStack.push(answer)
        return String(answer)
    }
}
