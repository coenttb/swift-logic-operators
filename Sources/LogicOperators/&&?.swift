//
//  &&?.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-05-2024.
//

import Foundation

// AND (&&?) Operator for Optional Booleans
infix operator &&? : LogicalConjunctionPrecedence

/// Custom operator for logical conjunction of optional Boolean values.
///
/// The `&&?` operator performs a logical AND operation between two optional Boolean values.
/// If either operand is `nil`, the result is `nil`. Otherwise, it returns the logical AND of the non-`nil` values.
///
/// - Parameters:
///   - left: An optional Boolean value on the left-hand side of the operator.
///   - right: An optional Boolean value on the right-hand side of the operator, evaluated lazily.
/// - Returns: An optional Boolean value that is `nil` if either operand is `nil`, or the logical AND of the non-`nil` values if both are non-`nil`.
/// - Throws: Rethrows any error thrown by the autoclosure evaluating `right`.
public func &&? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool? {
    guard let left = left else {
        return nil
    }
    guard let right = try right() else {
        return nil
    }
    return left && right
}
