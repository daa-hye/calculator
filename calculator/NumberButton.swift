//
//  NumberButton.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/14.
//

import Foundation
import UIKit

class NumberButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                backgroundColor = UIColor(red: 115.0/255.0, green: 115.0/255.0, blue: 115.0/255.0, alpha: 1)
            } else {
                backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
        backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
