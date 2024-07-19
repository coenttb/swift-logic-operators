//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 02-05-2024.
//

import Foundation

infix operator ||?: LogicalDisjunctionPrecedence

public func ||? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool? {
    switch (left, try right()) {
    case (nil, nil):
        return nil
    case let (lhs?, rhs?):
        return lhs || rhs
    case let (lhs?, nil):
        return lhs
    case let (nil, rhs?):
        return rhs
    }
}

// func &&? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool {
//    guard let left = left, let right = try right() else {
//        return false
//    }
//    return left && right
// }
//
// func &&? (left: Bool?, right: @autoclosure () throws -> Bool?) rethrows -> Bool? {
//    guard let left = left, let right = try right() else {
//        return nil
//    }
//    return left && right
// }
