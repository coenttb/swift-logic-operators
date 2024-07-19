//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import LogicOperators
import LogicTesting
import Testing

@Test("!?", arguments: Bool?.allCases)
func iuygsdjf(optional: Bool?) {
    switch optional {
    case .some(true):
        #expect(!?optional == false)
    case .some(false):
        #expect(!?optional == true)
    case .none:
        #expect(!?optional == nil)
    }
}

@Test("==?", arguments: Bool?.allCases, Bool?.allCases)
func asdnaslkdas(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (_, .none):
        #expect((left ==? right) == .none)
    case (_, .some(_)):
        #expect((left ==? right) != .none)
    }
}

@Test("&&?", arguments: Bool?.allCases, Bool?.allCases)
func hsdfsksdf(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left &&? right) == .none)
    case (_, .none):
        #expect((left &&? right) == .none)
    default:
        #expect((left &&? right) != .none)
    }
}

@Test("||?", arguments: Bool?.allCases, Bool?.allCases)
func aaksjda(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left ||? right) == .none)
    case (_, .none):
        #expect((left ||? right) == .none)
    default:
        #expect((left ||? right) != .none)
    }
}
