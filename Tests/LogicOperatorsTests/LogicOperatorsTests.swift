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
func notTest(optional: Bool?) {
    switch optional {
    case .some(true):
        #expect(!?optional == false)
    case .some(false):
        #expect(!?optional == true)
    case .none:
        #expect(!?optional == nil)
    }
}

@Test("!=?", arguments: Bool?.allCases, Bool?.allCases)
func notEqualsTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (_, .none):
        #expect((left !=? right) == .none)
    case (.none, _):
        #expect((left !=? right) == .none)
    case let (.some(l), .some(r)):
        #expect((left !=? right) == !(l == r))
    }
}

@Test("&&!?", arguments: Bool?.allCases, Bool?.allCases)
func nandTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left &&!? right) == .none)
    case (_, .none):
        #expect((left &&!? right) == .none)
    case (.some(let l), .some(let r)):
        #expect((left &&!? right) == !(l && r))
    }
}

@Test("&&?", arguments: Bool?.allCases, Bool?.allCases)
func andTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left &&? right) == .none)
    case (_, .none):
        #expect((left &&? right) == .none)
    case let (.some(l), .some(r)):
        #expect((left &&? right) == (l && r))
    }
}

@Test("^!?", arguments: Bool?.allCases, Bool?.allCases)
func xnorTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left ^!? right) == .none)
    case (_, .none):
        #expect((left ^!? right) == .none)
    case (.some(let l), .some(let r)):
        #expect((left ^!? right) == (l == r))
    }
}

@Test("^?", arguments: Bool?.allCases, Bool?.allCases)
func xorTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left ^? right) == .none)
    case (_, .none):
        #expect((left ^? right) == .none)
    case (.some(let l), .some(let r)):
        #expect((left ^? right) == (l != r))
    }
}

@Test("==?", arguments: Bool?.allCases, Bool?.allCases)
func equalsTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (_, .none):
        #expect((left ==? right) == .none)
    case (.none, _):
        #expect((left ==? right) == .none)
    case let (.some(l), .some(r)):
        #expect((left ==? right) == (l == r))
    }
}

@Test("||!?", arguments: Bool?.allCases, Bool?.allCases)
func norTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left ||!? right) == .none)
    case (_, .none):
        #expect((left ||!? right) == .none)
    case (.some(let l), .some(let r)):
        #expect((left ||!? right) == !(l || r))
    }
}

@Test("||?", arguments: Bool?.allCases, Bool?.allCases)
func orTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left ||? right) == .none)
    case (_, .none):
        #expect((left ||? right) == .none)
    case let (.some(l), .some(r)):
        #expect((left ||? right) == (l || r))
    }
}
