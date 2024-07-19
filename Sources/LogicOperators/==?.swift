//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 02/07/2024.
//

import Foundation

infix operator ==? : ComparisonPrecedence

/// Custom operator for comparing a non-optional value with an optional value for equality.
///
/// The `==?` operator compares a non-optional value (`lhs`) with an optional value (`rhs`).
/// If the optional value is `nil`, the result is `nil`. Otherwise, it returns the result of the equality comparison.
///
/// - Parameters:
///   - lhs: A non-optional value of type `T`.
///   - rhs: An optional value of type `T`, evaluated lazily using an autoclosure.
/// - Returns: An optional Boolean value that is `nil` if `rhs` is `nil`, `true` if `lhs` is equal to `rhs`,
///            and `false` if `lhs` is not equal to `rhs`.
/// - Throws: Rethrows any error thrown by the autoclosure evaluating `rhs`.
public func ==?<T: Equatable>(
    lhs: T?,
    rhs: @autoclosure () throws -> T?
) rethrows -> Bool? {
    guard let rhs = try rhs() else {
        return nil
    }
    return rhs == lhs
}
