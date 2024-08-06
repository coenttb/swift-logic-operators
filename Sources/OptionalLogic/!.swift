//
//  !.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 07/07/2024.
//

import Foundation

// N (!) Operator for Optional Booleans
prefix operator !

/// Custom prefix operator for logical negation of an optional Boolean value.
///
/// The `!` operator performs a logical NOT operation on an optional Boolean value.
/// If the value is `nil`, the result is `nil`. Otherwise, it returns the negation of the unwrapped Boolean value.
///
/// - Parameter value: An autoclosure that returns an optional Boolean value. This closure is evaluated lazily and can throw an error.
/// - Returns: An optional Boolean value that is the negation of the input value, or `nil` if the input value is `nil`.
/// - Throws: Rethrows any error thrown by the autoclosure.
///
/// The `!` operator can be used to safely negate optional Boolean values, taking advantage of lazy evaluation and error handling.
///
/// - Example:
/// ```swift
/// let a: Bool? = true
/// let b: Bool? = false
/// let c: Bool? = nil
///
/// do {
///     print(try !a) // Prints "Optional(false)"
///     print(try !b) // Prints "Optional(true)"
///     print(try !c) // Prints "nil"
/// } catch {
///     print("An error occurred: \(error)")
/// }
///
/// // Example with a throwing autoclosure
/// enum TestError: Error {
///     case intentionalError
/// }
///
/// let throwingValue: () throws -> Bool? = { throw TestError.intentionalError }
///
/// do {
///     print(try !throwingValue()) // Will throw an error
/// } catch {
///     print("An error occurred: \(error)") // Prints "An error occurred: intentionalError"
/// }
/// ```
prefix public func ! (
    value: @autoclosure () throws -> Bool?
) rethrows -> Bool?  {
    guard let unwrappedValue = try value() else {
        return nil
    }
    
    // Ideally, this would defer to Swift's ! operator, but doing so causes ambiguity.
    return unwrappedValue != true
}
