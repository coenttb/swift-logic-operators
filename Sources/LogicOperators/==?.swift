//
//  ==?.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

// Equality (==?) Operator for Optional Values
infix operator ==? : ComparisonPrecedence

/// Custom operator for comparing an optional value with a non-optional value for equality.
///
/// The `==?` operator compares an optional value (`lhs`) with a non-optional value (`rhs`).
/// If the optional value is `nil`, the result is `nil`. Otherwise, it returns the result of the equality comparison.
///
/// - Parameters:
///   - lhs: An optional value of type `T`, evaluated lazily using an autoclosure.
///   - rhs: A non-optional value of type `T`.
/// - Returns: An optional Boolean value that is `nil` if `lhs` is `nil`, `true` if `lhs` is equal to `rhs`,
///            and `false` if `lhs` is not equal to `rhs`.
/// - Throws: Rethrows any error thrown by the autoclosure evaluating `lhs`.
public func ==?<T: Equatable>(lhs: @autoclosure () throws -> T?, rhs: T) rethrows -> Bool? {
    guard let lhs = try lhs() else {
        return nil
    }
    return lhs == rhs
}
