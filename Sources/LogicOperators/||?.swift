//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-05-2024.
//

import Foundation

/// Custom operator for logical disjunction of optional Boolean values.
///
/// The `||?` operator performs a logical OR operation between two optional Boolean values.
/// The result is `nil` if both operands are `nil`. If either operand is non-nil, the result
/// is the logical OR of the non-nil values.
///
/// - Parameters:
///   - left: An optional Boolean value on the left-hand side of the operator.
///   - right: An optional Boolean value on the right-hand side of the operator, evaluated lazily.
/// - Returns: An optional Boolean value that is `nil` if both operands are `nil`. If either operand
///            is non-nil, the result is the logical OR of the unwrapped values.
///
/// - Note: This operator follows the precedence of `LogicalDisjunctionPrecedence`.
infix operator ||?: LogicalDisjunctionPrecedence

/// Performs a logical OR operation on two optional Boolean values.
///
/// The `||?` operator evaluates the `left` and `right` optional Boolean values. The result is `nil`
/// if both values are `nil`. If either value is non-nil, the result is the logical OR of the unwrapped
/// values.
///
/// - Parameters:
///   - left: An optional Boolean value.
///   - right: An optional Boolean value, evaluated lazily using autoclosure.
/// - Returns: An optional Boolean value that is `nil` if both `left` and `right` are `nil`. If either
///            `left` or `right` is non-nil, the result is the logical OR of the unwrapped values.
public func ||? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool? {
    switch (left, try right()) {
    case (nil, nil):
        return nil
    case let (lhs?, rhs?):
        return lhs || rhs
    case let (lhs?, nil):
        return lhs
    case let (nil, rhs?):
        return rhs
    }
}
