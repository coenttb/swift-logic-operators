//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import LogicOperators
import PredicateLogic
import OptionalLogic
import LogicTesting
import Testing

@Test("^", arguments: Bool.allCases, Bool.allCases)
func xorTest(lhs: Bool, rhs: Bool) {
    #expect((lhs ^ rhs) == (lhs != rhs))
}
//
//@Test("!?")
//func negateOptionalClosureTest() throws {
//    let isEven: (Int) -> Bool = { $0 % 2 == 0 }
//    var optionalIsEven: ((Int) -> Bool)? = isEven
//    let isOdd = !?optionalIsEven
//    
//    #expect(try isOdd(4) == false)
//    #expect(try isOdd(5) == true)
//    
//    optionalIsEven = nil
//    
//    #expect(try isOdd(4) == nil)
//    #expect(try isOdd(5) == nil)
//}
//
@Test("^?", arguments: Bool?.allCases, Bool?.allCases)
func xorTest(left: Bool?, right: Bool?) {
    switch (left, right) {
    case (.none, _):
        #expect((left ^? right) == .none)
    case (_, .none):
        #expect((left ^? right) == .none)
    case (.some(let l), .some(let r)):
        #expect((left ^? right) == (l ^ r))
    }
}
