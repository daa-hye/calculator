//
//  calculaterModel2.swift
//  calculator
//
//  Created by 박다혜 on 2023/05/23.
//

import Foundation

// 어떤 작업을 할 줄 알아야 하는가.

/*
 숫자 입력 가능해야 함
 연산 + - * / =
 백분율로 표기
 -버튼 누르면 음수 양수 변환, -0도 구현해야 함. 그러나 -0다음에 수를 입력하면 0이 제거됨
 
 소수점 연산 가능해야 함, 입력된 숫자가 없을 때 .을 누르면 0.으로 가정
 
 숫자 하나 제거 기능 필요
 C(clear) : 숫자만 초기화
 AC(all clear) : 초기 상태로 이동
 숫자가 입력되어있을 때만 C활성화, 그 외에는 AC
 
 두번째 연산자가 입력이 됐을 때,
 첫번째 연산자가 두번째 연산자보다 '우선순위가 높거나 같으면' 첫번째 연산자에 대한 계산을 진행
 */

// class vs struct

class CalculatorModel2 {
    // 여러개의 수를 받아서 하나의 수를 만들기 위한 입력 버퍼,
    // 마지막 자리를 지울 수도 있어야 하고, 음수를 저장할 수 있어야 한다.
    // 항상 숫자만 입력
    private var inputNumbersBuffer: String = ""
    private var inputOperatorsBuffer: String = ""
    private var numberStack = Stack<Double>()
    private var operatorStack = Stack<String>()
    
    private var newInputcheck = false
    
    //숫자 버퍼에 수 하나를 넣는 함수
    func addNumberToInputBuffer(_ number: String) {
        inputNumbersBuffer.append(number)
    }
    
    //숫자 버퍼 마지막 수 삭제
    func removeLastNumberInInputBuffer() {
        _ = inputNumbersBuffer.removeLast()
    }
    
    //숫자 버퍼에 있는 수 보여주기
    func showInputNumber() -> String {
        if inputNumbersBuffer == "" { return "0" }
        return inputNumbersBuffer
    }
    
    // 숫자 버퍼 -> 숫자 스택
    func addNumberToStack() {
        if let numberBuffer = Double(inputNumbersBuffer) {
            numberStack.push(numberBuffer)
            inputNumbersBuffer.removeAll()
        } else if inputNumbersBuffer.isEmpty || inputNumbersBuffer == "-" {
            numberStack.push(0)
            inputNumbersBuffer.removeAll()
        }
    }
    
    //연산자 버퍼에 연산자 넣는 함수
    func addOperatorToInputBuffer(_ operator: String) {
        if inputOperatorsBuffer == "" {
            addNumberToStack()
        }
        if let operatorInStack = operatorStack.lastElement() {
            if operatorCompare(op1: operatorInStack, op2: `operator`) == true {
                calculate()
            }
        }
        inputOperatorsBuffer = `operator`
    }
    
    // 연산자 버퍼 -> 연산자 스택
    func addOperatorToStack() {
        operatorStack.push(inputOperatorsBuffer)
        inputOperatorsBuffer.removeAll()
    }
    
    // +/- 부호 버튼
    func toggleSignOfInputBuffer() {
        if inputNumbersBuffer.first == "-" {
            _ = inputNumbersBuffer.removeFirst()
        } else {
            inputNumbersBuffer.insert("-", at: inputNumbersBuffer.startIndex)
        }
    }
    
    // 백분율
    func convertToPercentage() {
        if let numberBuffer = Double(inputNumbersBuffer) {
            if numberStack.isEmpty() {
                inputNumbersBuffer = "\(numberBuffer / 100.0)"
            } else {
                if let principal = numberStack.lastElement() {
                    inputNumbersBuffer = "\(principal * (numberBuffer / 100.0))"
                }
            }
            // 퍼센트 연산 후 연산자가 아니라 수를 입력하면 퍼센트 연산한 결과를 버려야함
        }
    }
    
    //소수점
    func markDecimalPoint() {
        if inputNumbersBuffer.isEmpty {
            inputNumbersBuffer.append("0.")
        } else { inputNumbersBuffer.append(".") }
    }
    
    // C
    func clear() {
        inputNumbersBuffer.removeAll()
    }
    
    // AC
    func allClear() {
        inputNumbersBuffer.removeAll()
        inputOperatorsBuffer.removeAll()
        numberStack.clearAll()
        operatorStack.clearAll()
    }
    
    // 연산자 우선순위 계산
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
    
    // 연산자 우선순위 비교
    func operatorCompare(op1: String, op2: String) -> Bool? {
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
    
    // 연산
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
    
    // 계산
    func calculate() {
        if let num2 = numberStack.pop(), let num1 = numberStack.pop(), let op = operatorStack.pop() {
            let answer = operation(num1: num1, num2: num2, op: op)
            inputNumbersBuffer = String(answer)
            numberStack.push(answer)
        }
    }
    
    // 모두 계산
    func calculateAll() {
        if operatorStack.count == 1 {
            calculate()
            numberStack.clearAll()
            return
        }
        var numberList = Array<Double>()
        var operatorList = Array<String>()
        
        while !numberStack.isEmpty() {
            if let number = numberStack.pop() {
                numberList.append(number)
            }
        }
        
        while !operatorStack.isEmpty() {
            if let `operator` = operatorStack.pop() {
                operatorList.append(`operator`)
            }
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
        inputNumbersBuffer = String(answer)
    }
    
}
