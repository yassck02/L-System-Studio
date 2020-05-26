//
//  Stack.swift
//  L-System-Studio
//
//  Created by Connor yass on 5/6/20.
//  Copyright © 2020 Chinaberry Tech, LLC. All rights reserved.
//

struct Stack<Element>: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Element

    fileprivate var elements: [Element] = []
    
    init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    mutating func pop() -> Element? {
        return elements.popLast()
    }
    
    func peek() -> Element? {
        return elements.last
    }
}
