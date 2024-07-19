//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-05-2024.
//

import Foundation

infix operator &&?: LogicalConjunctionPrecedence

public func &&? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool? {
    guard let left = left, let right = try right() else {
        return nil
    }
    return left && right
}
