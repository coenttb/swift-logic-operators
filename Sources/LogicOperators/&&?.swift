//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-05-2024.
//

import Foundation

/// Custom operator for logical conjunction of optional Boolean values.
///
/// The `&&?` operator performs a logical AND operation between two optional Boolean values.
/// If either operand is `nil`, the result is `nil`. If both operands are non-nil, the result is
/// the logical AND of the unwrapped values.
///
/// - Parameters:
///   - left: An optional Boolean value on the left-hand side of the operator.
///   - right: An optional Boolean value on the right-hand side of the operator, evaluated lazily.
/// - Returns: An optional Boolean value that is `nil` if either operand is `nil`, or the result of
///            the logical AND operation if both operands are non-nil.
///
/// - Note: This operator follows the precedence of `LogicalConjunctionPrecedence`.
infix operator &&?: LogicalConjunctionPrecedence

/// Performs a logical AND operation on two optional Boolean values.
///
/// The `&&?` operator evaluates the `left` and `right` optional Boolean values. If either value
/// is `nil`, the result is `nil`. If both values are non-nil, the result is the logical AND of
/// the unwrapped values.
///
/// - Parameters:
///   - left: An optional Boolean value.
///   - right: An optional Boolean value, evaluated lazily using autoclosure.
/// - Returns: An optional Boolean value that is `nil` if either `left` or `right` is `nil`,
///            otherwise the logical AND of the unwrapped values.
public func &&? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool? {
    guard let left = left, let right = try right() else {
        return nil
    }
    return left && right
}
