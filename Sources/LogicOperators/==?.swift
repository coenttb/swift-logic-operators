//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02/07/2024.
//

import Foundation

/// Custom operator for comparing an optional value with a non-optional value for equality.
///
/// The `==?` operator compares an optional value (`lhs`) with a non-optional value (`rhs`).
/// If the optional value is `nil` or not equal to the non-optional value, the result is `nil`.
/// Otherwise, it returns the unwrapped optional value.
///
/// - Parameters:
///   - lhs: An optional value of type `T`.
///   - rhs: A non-optional value of type `T`.
/// - Returns: The unwrapped value of `lhs` if it is not `nil` and equal to `rhs`; otherwise, `nil`.
///
/// - Note: This operator follows the precedence of `ComparisonPrecedence`.
infix operator ==? : ComparisonPrecedence

/// Compares an optional value with a non-optional value for equality.
///
/// The `==?` operator evaluates the `lhs` and `rhs` values. If `lhs` is `nil` or not equal to `rhs`,
/// the result is `nil`. If `lhs` is equal to `rhs`, the result is the unwrapped value of `lhs`.
///
/// - Parameters:
///   - lhs: An optional value of type `T`.
///   - rhs: A non-optional value of type `T`.
/// - Returns: The unwrapped value of `lhs` if it is not `nil` and equal to `rhs`; otherwise, `nil`.
public func ==?<T: Equatable>(lhs: T?, rhs: T) -> T? {
    guard let lhs = lhs, lhs == rhs else {
        return nil
    }
    return lhs
}
