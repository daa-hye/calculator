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
    @IBAction func claerButtonDidTap(_ sender: UIButton) {
        outputLabel.text = "0"
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
        }
    }
    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            calculatorStack.push(element: currentOutput)
        }
    }
    @IBAction func multipleButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            calculatorStack.push(element: currentOutput)
        }
    }
    @IBAction func devideButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            calculatorStack.push(element: currentOutput)
        }
    }
    @IBAction func equalButtonDidTap(_ sender: UIButton) {
    }
    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            let number = String(sender.tag)
            if outputLabel.text == "0" {
                outputLabel.text = number
            } else {
                outputLabel.text = currentOutput + number
            }
        }
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

