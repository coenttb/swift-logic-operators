//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 21/07/2024.
//

import Foundation

infix operator ^^ : MultiplicationPrecedence

/// Custom infix operator for exponentiation.
///
/// The `^^` operator raises the `radix` to the power of `power`.
///
/// - Parameters:
///   - radix: The base value.
///   - power: The exponent value.
/// - Returns: The result of raising `radix` to the power of `power`.
public func ^^ (radix: Int, power: Int) -> Int {
    return Int(pow(Double(radix), Double(power)))
}
