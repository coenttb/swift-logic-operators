//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

/// Custom operator for comparing an optional value with a non-optional value.
///
/// The `!=?` operator compares an optional value (`lhs`) with a non-optional value (`rhs`).
/// If the optional value is `nil` or equal to the non-optional value, the result is `nil`.
/// Otherwise, it returns the unwrapped optional value.
///
/// - Parameters:
///   - lhs: An optional value of type `T`.
///   - rhs: A non-optional value of type `T`.
/// - Returns: The unwrapped value of `lhs` if it is not `nil` and not equal to `rhs`; otherwise, `nil`.
///
/// - Note: This operator follows the precedence of `ComparisonPrecedence`.
infix operator !=? : ComparisonPrecedence

public func !=?<T: Equatable>(
    lhs: T?,
    rhs: T
) -> T? {
    guard let lhs = lhs, lhs != rhs else {
        return nil
    }
    return lhs
}
