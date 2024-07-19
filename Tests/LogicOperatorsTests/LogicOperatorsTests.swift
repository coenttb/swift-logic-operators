//
//  File.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import LogicOperators
import Testing

extension Bool?:@retroactive CaseIterable {
    static public var allCases: [Optional<Bool>] = [.some(true), .some(false), .none]
}

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
