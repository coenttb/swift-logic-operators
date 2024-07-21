//
//  !=.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

/// Custom infix operator for logical inequality of two Boolean-returning closures.
///
/// The `!=` operator performs a logical inequality (not equal) operation on the results of two closures that take a parameter of type `A` and return Booleans.
/// It returns a new closure that returns `true` if the results of the original closures are not equal, and `false` otherwise.
///
/// - Parameters:
///   - lhs: A closure that takes a parameter of type `A` and returns a Boolean.
///   - rhs: A closure that takes a parameter of type `A` and returns a Boolean.
/// - Returns: A new closure that takes a parameter of type `A` and returns `true` if the results of the original closures are not equal, and `false` otherwise.
///
/// - Example:
/// ```swift
/// let isEven: (Int) -> Bool = { $0 % 2 == 0 }
/// let isPositive: (Int) -> Bool = { $0 > 0 }
/// let isEvenAndPositiveDifferent = isEven != isPositive
///
/// print(isEvenAndPositiveDifferent(4))  // Prints "false"
/// print(isEvenAndPositiveDifferent(-4)) // Prints "true"
/// print(isEvenAndPositiveDifferent(3))  // Prints "true"
/// print(isEvenAndPositiveDifferent(-3)) // Prints "true"
/// ```
public func !=<A>(
    lhs: @escaping (A) -> Bool,
    rhs: @escaping (A) -> Bool
) -> (A) -> Bool {
    return { a in
        lhs(a) != rhs(a)
    }
}
