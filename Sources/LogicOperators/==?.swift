//
//  ==?.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

// Equality (==?) Operator for Optional Values
infix operator ==? : ComparisonPrecedence

/// Custom operator for comparing two optional values for equality.
///
/// The `==?` operator compares two optional values (`lhs` and `rhs`) for equality.
/// If either optional value is `nil`, the result is `nil`. Otherwise, it returns the result of the equality comparison.
///
/// - Parameters:
///   - lhs: An optional value of type `T`.
///   - rhs: An optional value of type `T`, evaluated lazily using an autoclosure.
/// - Returns: An optional Boolean value that is `nil` if either `lhs` or `rhs` is `nil`, `true` if `lhs` is equal to `rhs`,
///            and `false` if `lhs` is not equal to `rhs`.
/// - Throws: Rethrows any error thrown by the autoclosure evaluating `rhs`.
public func ==?<T: Equatable>(lhs: T?, rhs: @autoclosure () throws -> T?) rethrows -> Bool? {
    guard let lhs = lhs else {
        return nil
    }
    guard let rhs = try rhs() else {
        return nil
    }
    return lhs == rhs
}
