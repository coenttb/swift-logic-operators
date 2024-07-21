//
//  &&!.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

// NAND (&&!) Operator for Optional Booleans
infix operator &&!: LogicalConjunctionPrecedence

/// Custom infix operator for logical NAND (NOT AND) of two optional Boolean values.
///
/// The `&&!` operator performs a logical NAND operation on two optional Boolean values.
/// If either value is `nil`, the result is `nil`. Otherwise, it returns the logical NAND (NOT AND) of the two values.
///
/// - Parameters:
///   - left: An optional Boolean value.
///   - right: An autoclosure that returns an optional Boolean value. This closure is evaluated lazily and can throw an error.
/// - Returns: An optional Boolean value that is the NAND of the two input values, or `nil` if either input is `nil`.
/// - Throws: Rethrows any error thrown by the autoclosure.
///
/// The `&&!` operator can be used to safely perform a logical NAND operation on optional Boolean values, taking advantage of lazy evaluation and error handling.
///
/// - Example:
/// ```swift
/// let a: Bool? = true
/// let b: Bool? = false
/// let c: Bool? = nil
///
/// do {
///     print(try a &&! b) // Prints "Optional(true)"
///     print(try a &&! c) // Prints "nil"
///     print(try b &&! c) // Prints "nil"
///     print(try b &&! b) // Prints "Optional(true)"
///     print(try a &&! a) // Prints "Optional(false)"
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
///     print(try a &&! throwingValue()) // Will throw an error
/// } catch {
///     print("An error occurred: \(error)") // Prints "An error occurred: intentionalError"
/// }
/// ```
//@_disfavoredOverload
public func &&! (
    left: Bool?,
    right: @autoclosure () throws -> Bool?
) rethrows -> Bool? {
    return try !(left && right())
}
