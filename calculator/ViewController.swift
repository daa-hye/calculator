//
//  ViewController.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    let calculateModel = CalculatorModel2()

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet var numberButtons: [NumberButton]!
    @IBOutlet weak var clearButton: UtilityButton!
    @IBOutlet weak var plusButton: OperatorButton! {
        didSet {
            plusButton.setTitle("+", for: .selected)
            plusButton.setTitle("+", for: .normal)
        }
    }

    @IBOutlet weak var minusButton: OperatorButton! {
        didSet {
            minusButton.setTitle("-", for: .selected)
            minusButton.setTitle("-", for: .normal)
        }
    }

    @IBOutlet weak var multipleButton: OperatorButton! {
        didSet {
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

    @IBAction func clearButtonDidTap(_ sender: UIButton) {
        calculateModel.clear()
        setOutputLabel()
    }

    @IBAction func percentButtonDidTap(_ sender: UIButton) {
        calculateModel.convertToPercentage()
        setOutputLabel()
    }

    @IBAction func pointButtonDidTap(_ sender: UIButton) {
        calculateModel.markDecimalPoint()
        setOutputLabel()
    }

    @IBAction func negativeButtonDidTap(_ sender: UIButton) {
        clearOperator()
        calculateModel.toggleSignOfInputBuffer()
        setOutputLabel()
    }

    @IBAction func plusButtonDidTap(_ sender: UIButton) {
        clearOperator()
        sender.isSelected = true
        calculateModel.addOperatorToInputBuffer("+")
    }

    @IBAction func minusButtonDidTap(_ sender: UIButton) {
        clearOperator()
        sender.isSelected = true
        calculateModel.addOperatorToInputBuffer("-")
    }

    @IBAction func multipleButtonDidTap(_ sender: UIButton) {
        clearOperator()
        sender.isSelected = true
        calculateModel.addOperatorToInputBuffer("*")
    }

    @IBAction func devideButtonDidTap(_ sender: UIButton) {
        clearOperator()
        calculateModel.addOperatorToInputBuffer("/")
        sender.isSelected = true
    }

    @IBAction func equalButtonDidTap(_ sender: UIButton) {
        equalButton.isSelected = false
        calculateModel.calculateAll()
        setOutputLabel()
    }

    @IBAction func numberButtonDidTap(_ sender: UIButton) {
        clearButton.setTitle("C", for: .normal)
        let number = sender.tag
        calculateModel.addNumberToInputBuffer("\(number)")
        setOutputLabel()
    }

    func clearOperator() {
        plusButton.isSelected = false
        minusButton.isSelected = false
        multipleButton.isSelected = false
        devideButton.isSelected = false
    }

    func setOutputLabel() {
        let text = calculateModel.showInputNumber()
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
