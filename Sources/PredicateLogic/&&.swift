//
//  &&?.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-05-2024.
//

import Foundation

/// Custom infix operator for logical AND of two Boolean-returning closures.
///
/// The `&&` operator performs a logical AND operation on the results of two closures that take a parameter of type `A` and return Booleans.
/// It returns a new closure that returns the AND of the results of the original closures.
///
/// - Parameters:
///   - lhs: A closure that takes a parameter of type `A` and returns a Boolean.
///   - rhs: A closure that takes a parameter of type `A` and returns a Boolean.
/// - Returns: A new closure that takes a parameter of type `A` and returns the AND of the results of the original closures.
///
/// - Example:
/// ```swift
/// let isEven: (Int) -> Bool = { $0 % 2 == 0 }
/// let isPositive: (Int) -> Bool = { $0 > 0 }
/// let isEvenAndPositive = isEven && isPositive
///
/// print(isEvenAndPositive(4)) // Prints "true"
/// print(isEvenAndPositive(-4)) // Prints "false"
/// print(isEvenAndPositive(3)) // Prints "false"
/// print(isEvenAndPositive(-3)) // Prints "false"
/// ```
public func &&<A>(
    lhs: @escaping (A) -> Bool,
    rhs: @escaping (A) -> Bool
) -> (A) -> Bool {
    return { a in
        lhs(a) && rhs(a)
    }
}
