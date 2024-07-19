//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02/07/2024.
//

import Foundation

infix operator ==? : ComparisonPrecedence
infix operator !=? : ComparisonPrecedence

public func ==?<T: Equatable>(lhs: T?, rhs: T) -> T? {
    guard let lhs = lhs, lhs == rhs else {
        return nil
    }
    return lhs
}

public func !=?<T: Equatable>(lhs: T?, rhs: T) -> T? {
    guard let lhs = lhs, lhs != rhs else {
        return nil
    }
    return lhs
}
