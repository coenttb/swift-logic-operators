//
//  !.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 06/11/2022.
//

import Foundation

// N (!) Operator for a Boolean-returning closure.
prefix operator !


/// Custom prefix operator for logical negation of an optional Boolean-returning closure.
///
/// The `!?` operator performs a logical NOT operation on the result of a closure that takes a parameter of type `A` and returns a Boolean.
/// It returns a new closure that negates the result of the original closure, or `nil` if the original closure is `nil`.
///
/// - Parameter closure: An optional closure that takes a parameter of type `A` and returns a Boolean. This parameter is evaluated lazily using an autoclosure.
/// - Returns: A new closure that takes a parameter of type `A` and returns the negation of the original closure's result, or `nil` if the original closure is `nil`.
/// - Throws: Rethrows any error thrown by the original closure when it is called.
///
/// The `!?` operator can be used to invert the result of a predicate function or any other Boolean-returning closure, even if the closure might throw errors.
///
/// - Example:
/// ```swift
/// let isEven: (Int) -> Bool = { $0 % 2 == 0 }
/// let optionalIsEven: ((Int) -> Bool)? = isEven
/// let isOdd = try !?optionalIsEven
///
/// print(try isOdd(4))  // Prints "Optional(false)"
/// print(try isOdd(5))  // Prints "Optional(true)"
///
/// let nilClosure: ((Int) -> Bool)? = nil
/// let isNilOdd = try !?nilClosure
///
/// print(try isNilOdd(4)) // Prints "nil"
///
/// enum TestError: Error {
///     case intentionalError
/// }
///
/// let throwingClosure: (Int) throws -> Bool = { _ in throw TestError.intentionalError }
/// let optionalThrowingClosure: ((Int) throws -> Bool)? = throwingClosure
///
/// let isNotThrowing = try !?optionalThrowingClosure
///
/// do {
///     print(try isNotThrowing(4))  // Will throw an error
/// } catch {
///     print("An error occurred: \(error)")
/// }
/// ```
public prefix func !?<A>(
    _ closure: @autoclosure @escaping () throws -> ((A) -> Bool)?
) rethrows -> (A) throws -> Bool? {
    return { a in
        guard let closure = try closure() else {
            return nil
        }
        return !closure(a)
    }
}
