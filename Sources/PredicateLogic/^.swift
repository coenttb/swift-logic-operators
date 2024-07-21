//
//  ^.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

/// Custom infix operator for logical XOR of two Boolean-returning closures.
///
/// The `^` operator performs a logical XOR operation on the results of two closures that take a parameter of type `A` and return Booleans.
/// It returns a new closure that returns the XOR of the results of the original closures.
///
/// - Parameters:
///   - lhs: A closure that takes a parameter of type `A` and returns a Boolean.
///   - rhs: A closure that takes a parameter of type `A` and returns a Boolean.
/// - Returns: A new closure that takes a parameter of type `A` and returns the XOR of the results of the original closures.
///
/// - Example:
/// ```swift
/// let isEven: (Int) -> Bool = { $0 % 2 == 0 }
/// let isNegative: (Int) -> Bool = { $0 < 0 }
/// let isEvenXorNegative = isEven ^ isNegative
///
/// print(isEvenXorNegative(4)) // Prints "true"
/// print(isEvenXorNegative(-4)) // Prints "false"
/// print(isEvenXorNegative(3)) // Prints "true"
/// print(isEvenXorNegative(-3)) // Prints "false"
/// ```
public func ^<A>(
    lhs: @escaping (A) -> Bool,
    rhs: @escaping (A) -> Bool
) -> (A) -> Bool {
    lhs != rhs
}
