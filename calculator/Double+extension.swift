//
//  Double+extension.swift
//  calculator
//
//  Created by 박다혜 on 2023/03/20.
//

import Foundation

extension Double {
    var isInteger: Bool {
        return self == Double(Int(self))
    }
}
