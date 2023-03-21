//
//  ViewController.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    
    var calculatorStack = CalculatorModel.CalculatorStack()
    
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
    @IBOutlet weak var equalButton: OperatorButton!{
        didSet{
            
        }
    }
    @IBAction func claerButtonDidTap(_ sender: UIButton) {
        if clearButton.titleLabel?.text == "C" {
            outputLabel.text = "0"
            calculatorStack.clearAll()
            clearButton.setTitle("AC", for: .normal)
        } else if clearButton.titleLabel?.text == "AC" {
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
            calculatorStack.push(element: currentOutput)
            clearOperator()
            sender.isSelected = true
        }
    }
    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            calculatorStack.push(element: currentOutput)
            clearOperator()
            sender.isSelected = true
        }
    }
    @IBAction func multipleButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            calculatorStack.push(element: currentOutput)
            clearOperator()
            sender.isSelected = true
        }
    }
    @IBAction func devideButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            calculatorStack.push(element: currentOutput)
            clearOperator()
            sender.isSelected = true
        }
    }
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        
    }
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            let number = String(sender.tag)
            if isOperatorSelected() {
                outputLabel.text = number
                clearOperator()
            } else {
                if outputLabel.text == "0" {
                    outputLabel.text = number
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
    
    func isOperatorSelected() -> Bool {
        return plusButton.isSelected || minusButton.isSelected || multipleButton.isSelected || devideButton.isSelected
        
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

