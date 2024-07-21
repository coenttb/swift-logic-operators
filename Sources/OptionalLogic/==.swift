//
//  ==?.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation

// Equality (==?) Operator for Optional Values
infix operator ==? : ComparisonPrecedence

/// Custom infix operator for logical equality of two optional Equatable values.
///
/// The `==?` operator performs a logical equality operation on two optional Equatable values.
/// If either value is `nil`, the result is `nil`. Otherwise, it returns `true` if the values are equal, and `false` if they are not.
///
/// - Parameters:
///   - lhs: An optional Equatable value.
///   - rhs: An autoclosure that returns an optional Equatable value. This closure is evaluated lazily and can throw an error.
/// - Returns: An optional Boolean value that is `true` if the values are equal, `false` if they are not, or `nil` if either input is `nil`.
/// - Throws: Rethrows any error thrown by the autoclosure.
///
/// The `==?` operator can be used to safely compare optional Equatable values for equality, taking advantage of lazy evaluation and error handling.
///
/// - Example:
/// ```swift
/// let a: Bool? = true
/// let b: Bool? = false
/// let c: Bool? = nil
///
/// do {
///     print(try a ==? b) // Prints "Optional(false)"
///     print(try a ==? c) // Prints "nil"
///     print(try b ==? c) // Prints "nil"
///     print(try b ==? b) // Prints "Optional(true)"
///     print(try a ==? a) // Prints "Optional(true)"
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
///     print(try a ==? throwingValue()) // Will throw an error
/// } catch {
///     print("An error occurred: \(error)") // Prints "An error occurred: intentionalError"
/// }
/// ```
public func ==?<T: Equatable>(
    lhs: T?,
    rhs: @autoclosure () throws -> T?
) rethrows -> Bool? {
    guard let lhs = lhs else {
        return nil
    }
    guard let rhs = try rhs() else {
        return nil
    }
    return lhs == rhs
}
