//
//  !.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 06/11/2022.
//

import Foundation

/// Custom prefix operator for logical negation of a Boolean-returning closure.
///
/// The `!` operator performs a logical NOT operation on the result of a closure that takes a parameter of type `A` and returns a Boolean.
/// It returns a new closure that negates the result of the original closure.
///
/// - Parameter closure: A closure that takes a parameter of type `A` and returns a Boolean.
/// - Returns: A new closure that takes a parameter of type `A` and returns the negation of the original closure's result.
///
/// The `!` operator can be used to invert the result of a predicate function or any other Boolean-returning closure.
///
/// - Example:
/// ```swift
/// let isEven: (Int) -> Bool = { $0 % 2 == 0 }
/// let isOdd = !isEven
///
/// print(isEven(4)) // Prints "true"
/// print(isOdd(4))  // Prints "false"
/// print(isEven(5)) // Prints "false"
/// print(isOdd(5))  // Prints "true"
/// ```
public prefix func !<A>(
    _ closure: @escaping (A) throws -> Bool
) -> (A) throws -> Bool {
    return { a in
        try !closure(a)
    }
}

public prefix func !<A>(
    _ closure: @escaping (A) -> Bool
) -> (A) -> Bool {
    return { a in
        !closure(a)
    }
}
