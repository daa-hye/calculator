//
//  Stack.swift
//  calculator
//
//  Created by 박다혜 on 2023/04/04.
//

import Foundation
struct Stack<T> {
    private var stack = [T]()
    private var stackDuplicate = [T]()
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    func lastElement() -> T? {
        if let last = stack.last{
            return last
        }
        return nil
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    mutating func clearAll() {
        stack.removeAll()
    }
    
    mutating func duplicateStack() {
        stackDuplicate = stack
    }
        
    var count: Int {
        return stack.count
    }
}
