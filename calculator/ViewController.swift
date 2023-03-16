//
//  ViewController.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet var numberButtons: [NumberButton]!
    @IBAction func numberButtonDidTab(_ sender: UIButton) {
        if let currentOutput = outputLabel.text {
            let number = String(sender.tag)
            if outputLabel.text == "0"{
                outputLabel.text = number
            }else{
                outputLabel.text = currentOutput + number
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black
        outputLabel.textColor = UIColor.white
        outputLabel.text = "0"
    }
    
}


