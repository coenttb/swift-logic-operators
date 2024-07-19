//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 07/07/2024.
//

import Foundation

precedencegroup PrefixUnaryPrecedence {
    associativity: right
    higherThan: AssignmentPrecedence
}

prefix operator !?

/// Custom prefix operator for logical negation of an optional Boolean value.
///
/// The `!?` operator performs a logical NOT operation on an optional Boolean value.
/// If the optional value is `nil`, the result is `nil`. Otherwise, it returns the logical negation of the unwrapped value.
///
/// - Parameter value: An optional Boolean value.
/// - Returns: An optional Boolean value that is `nil` if `value` is `nil`, and the logical negation of the unwrapped value otherwise.
prefix public func !? (
    value: Bool?
) -> Bool? {
    guard let unwrappedValue = value else {
        return nil
    }
    return !unwrappedValue
}
