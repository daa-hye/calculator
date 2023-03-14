//
//  OperatorButton.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import Foundation
import UIKit

class OperatorButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor(red: 251.0/255.0, green: 199.0/255.0, blue: 141.0/255.0, alpha: 1) : UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
        backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        setTitleColor(.white, for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
