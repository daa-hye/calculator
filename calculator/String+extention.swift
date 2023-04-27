//
//  String+extention.swift
//  calculator
//
//  Created by 박다혜 on 2023/04/05.
//

import Foundation

extension String {
    var isDouble: Bool {
        return (Double(self) != nil)
    }
}
