//
//  ViewController.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    
    let calculatorModel = CalculatorModel()

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
            if let op = calculatorModel.showOperator() {
                reloadOperator(op: op)
            }
            clearButton.setTitle("AC", for: .normal)
        } else if clearButton.titleLabel?.text == "AC" {
            calculatorModel.deleteAll()
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
        
        if let currentOutput = outputLabel.text {
            if !(currentOutput.contains("-")) {
                outputLabel.text = "-" + currentOutput
            } else {
                outputLabel.text?.removeFirst()
            }
        }
    }
    
    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        
        if whichOperatorSelected() == nil { calculatorModel.addElement()}
        
        if calculatorModel.numberOperator > 0 {
            guard let preCalculation = calculatorModel.calaulateAll() else { return }
            setOutputLabel(text: preCalculation)
        }
        clearOperator()
        sender.isSelected = true
    }
    
    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        
        if whichOperatorSelected() == nil { calculatorModel.addElement()}
        
        if calculatorModel.numberOperator > 0 {
            guard let preCalculation = calculatorModel.calaulateAll() else { return }
            setOutputLabel(text: preCalculation)
        }
        clearOperator()
        sender.isSelected = true
    }
    
    @IBAction func multipleButtonDidTap(_ sender: UIButton) {
        
        if whichOperatorSelected() == nil { calculatorModel.addElement()}
        
        if calculatorModel.numberOperator > 0 && ["*", "/"].contains(calculatorModel.showOperator()) {
            guard let preCalculation = calculatorModel.calaulateAll() else { return }
            setOutputLabel(text: preCalculation)
        }

        clearOperator()
        sender.isSelected = true
    }
    
    @IBAction func devideButtonDidTap(_ sender: UIButton) {
        
        if whichOperatorSelected() == nil { calculatorModel.addElement()}
        
        if calculatorModel.numberOperator > 0 && ["*", "/"].contains(calculatorModel.showOperator()) {
            guard let preCalculation = calculatorModel.calaulateAll() else { return }
            setOutputLabel(text: preCalculation)
        }

        clearOperator()
        sender.isSelected = true
    }
    
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        equalButton.isSelected = false
        if let currentOutput = outputLabel.text {
            if whichOperatorSelected() == nil {
                calculatorModel.addElement(currentOutput)
            }
            clearOperator()
        }
        if calculatorModel.numberOperator > 0 {
            guard let calculation = calculatorModel.calaulateAll() else { return }
            setOutputLabel(text: calculation)
        }
    }
    
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        let number = String(sender.tag)
        calculatorModel.appendNumber(number)
        
        let currentOutput = calculatorModel.showNumber()
        setOutputLabel(text: currentOutput)

        clearButton.setTitle("C", for: .normal)
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
    
    func setOutputLabel(text: String) {
        guard let value = Double(text) else { return }
        
        outputLabel.text = value.isInteger ? "\(Int(value))" : "\(value)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.black
        outputLabel.textColor = UIColor.white
        outputLabel.font = UIFont.systemFont(ofSize: 70)
        outputLabel.text = "0"
    }
    
}

