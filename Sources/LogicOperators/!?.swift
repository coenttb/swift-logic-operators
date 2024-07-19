//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 07/07/2024.
//

import Foundation

// Define the custom precedence group
precedencegroup PrefixUnaryPrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
}

// Define the custom operator !?
prefix operator !?

// Implement the operator function
prefix public func !? (value: Bool?) -> Bool? {
    guard let unwrappedValue = value else {
        return nil
    }
    return !unwrappedValue
}
