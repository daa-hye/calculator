//
//  ViewController.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatorStack = CalculatorModel.CalculatorStack()
    var calculatorStackCopy = CalculatorModel.CalculatorStack()
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet var numberButtons: [NumberButton]!
    @IBOutlet weak var clearButton: UtilityButton!
    
    @IBOutlet weak var plusButton: OperatorButton!{
        didSet {
            plusButton.setTitle("+", for: .selected)
            plusButton.setTitle("+", for: .normal)
        }
    }
    @IBOutlet weak var minusButton: OperatorButton!{
        didSet {
            minusButton.setTitle("-", for: .selected)
            minusButton.setTitle("-", for: .normal)
        }
    }
    @IBOutlet weak var multipleButton: OperatorButton!{
        didSet{
            multipleButton.setTitle("×", for: .selected)
            multipleButton.setTitle("×", for: .normal)
        }
    }
    @IBOutlet weak var devideButton: OperatorButton! {
        didSet {
            devideButton.setTitle("÷", for: .selected)
            devideButton.setTitle("÷", for: .normal)
        }
    }
    @IBOutlet weak var equalButton: OperatorButton!
    
    @IBAction func claerButtonDidTap(_ sender: UIButton) {
        if clearButton.titleLabel?.text == "C" {
            outputLabel.text = "0"
            if let op = calculatorStack.pop() {
                reloadOperator(op: op)
            }
            clearButton.setTitle("AC", for: .normal)
        } else if clearButton.titleLabel?.text == "AC" {
            calculatorStack.clearAll()
            clearOperator()
        }
    }
    @IBAction func percentButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            if outputLabel.text != "0" {
                outputLabel.text = String(Double(currentOutput)! / 100.0)
            }
        }
    }
    @IBAction func pointButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            if !(currentOutput.contains(".")) {
                outputLabel.text = currentOutput + "."
            }
        }
    }
    @IBAction func negativeButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text{
            if !(currentOutput.contains("-")) {
                outputLabel.text = "-" + currentOutput
            } else {
                outputLabel.text?.removeFirst()
            }
        }
    }
    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            if whichOperatorSelected() == nil {
                calculatorStack.push(element: currentOutput)
                clearOperator()
            }
            sender.isSelected = true
        }
    }
    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            if whichOperatorSelected() == nil {
                calculatorStack.push(element: currentOutput)
                clearOperator()
            }
            sender.isSelected = true
        }
    }
    @IBAction func multipleButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            if whichOperatorSelected() == nil {
                calculatorStack.push(element: currentOutput)
                clearOperator()
            }
            sender.isSelected = true
        }
    }
    @IBAction func devideButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            if whichOperatorSelected() == nil {
                calculatorStack.push(element: currentOutput)
                clearOperator()
            }
            sender.isSelected = true
        }
    }
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        equalButton.isSelected = false
        print(calculatorStack)
        
    }
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            let number = String(sender.tag)
            if let op = whichOperatorSelected() {
                outputLabel.text = number
                calculatorStack.push(element: op)
                clearOperator()
            } else {
                if outputLabel.text == "0" {
                    outputLabel.text = number
                } else if outputLabel.text == "-0" {
                    outputLabel.text = "-\(number)"
                } else {
                    outputLabel.text = currentOutput + number
                }
            }
            clearButton.setTitle("C", for: .normal)
        }
    }
    
    func clearOperator() {
        plusButton.isSelected = false
        minusButton.isSelected = false
        multipleButton.isSelected = false
        devideButton.isSelected = false
    }
    
    func whichOperatorSelected() -> String? {
        if plusButton.isSelected { return "+" }
        else if minusButton.isSelected { return "-" }
        else if multipleButton.isSelected { return "*" }
        else if devideButton.isSelected { return "/" }
        else { return nil }
    }
    
    func reloadOperator(op: String) {
        if op == "+" {
            plusButton.isSelected = true
            print(plusButton.isSelected)
        }
        else if op == "-" { minusButton.isSelected = true}
        else if op == "*" { multipleButton.isSelected = true}
        else if op == "/" { devideButton.isSelected = true}
        else {}
    }
    
    func checkElementDuplication(element: String) -> Bool {
        return calculatorStack.isEmpty() || element != calculatorStack.lastElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorStack = CalculatorModel.CalculatorStack()
        
        view.backgroundColor = UIColor.black
        outputLabel.textColor = UIColor.white
        outputLabel.font = UIFont.systemFont(ofSize: 70)
        outputLabel.text = "0"
    }
    
}

