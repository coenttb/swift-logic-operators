//
//  !=?.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

// Inequality (!=?) Operator for Optional Values
infix operator !=? : ComparisonPrecedence

/// Custom operator for comparing an optional value with a non-optional value for inequality.
///
/// The `!=?` operator compares an optional value (`lhs`) with a non-optional value (`rhs`).
/// If the optional value is `nil`, the result is `nil`. Otherwise, it returns the result of the inequality comparison.
///
/// - Parameters:
///   - lhs: An optional value of type `T`.
///   - rhs: A non-optional value of type `T`.
/// - Returns: An optional Boolean value that is `nil` if `lhs` is `nil`, `true` if `lhs` is not equal to `rhs`,
///            and `false` if `lhs` is equal to `rhs`.
public func !=?<T: Equatable>(lhs: T?, rhs: T) -> Bool? {
    guard let lhs = lhs else {
        return nil
    }
    return lhs != rhs
}
