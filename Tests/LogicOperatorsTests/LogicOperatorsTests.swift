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

@Test("&&?", arguments: Bool?.allCases, Bool?.allCases)
func hsdfsksdf(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.some(true), .some(true)):
        let x = (left &&? right) == true
        #expect(x)
        
        let y = left &&? right == true
        #expect(y)
    default:
        ()
        
    }
}
//
//@Test("==?", arguments: Bool?.allCases)
//func asdnaslkdas(left: Bool?, right: Bool?) {
//    switch optional {
//    case .some(true):
//        #expect(!?optional == false)
//    case .some(false):
//        #expect(!?optional == true)
//    case .none:
//        #expect(!?optional == nil)
//    }
//}
//
//
//
//@Test("||?", arguments: Bool?.allCases)
//func mlasiahda(left: Bool?, right: Bool?) {
//    switch optional {
//    case .some(true):
//        #expect(!?optional == false)
//    case .some(false):
//        #expect(!?optional == true)
//    case .none:
//        #expect(!?optional == nil)
//    }
//}
//
//
