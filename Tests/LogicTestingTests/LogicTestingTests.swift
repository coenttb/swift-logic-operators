//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 19/07/2024.
//

import Foundation
import LogicTesting
import Testing



@Test("Bool?")
func iuygsdjf() {
    #expect(Bool?.allCases.count == 3)
}

@Test("[(Bool?)]")
func asdmasf() {
    #expect([(Bool?)].allCases.count == Bool?.allCases.count)
}

@Test("[(Bool?, Bool?)]?")
func asdhalk() {
    #expect([(Bool?, Bool?)].allCases.count == 9)
}

@Test("[(Bool?, Bool?, Bool?)]")
func nsdhas() {
    #expect([(Bool?, Bool?, Bool?)].allCases.count == 27)
}

@Test("[(Bool?, Bool?, Bool?, Bool?)]")
func asdfga() {
    #expect([(Bool?, Bool?, Bool?)].allCases.count == 27)
}
@Test("[(Bool?, Bool?, Bool?, Bool?)]")
func sadaf(){
    #expect([(Bool?, Bool?, Bool?, Bool?)].allCases.count == 81)
}
@Test("[(Bool?, Bool?, Bool?, Bool?, Bool?)]")
func asdfasdf(){
    #expect([(Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.count == 243)
}
@Test("[(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)]")
func asdghgrfg(){
    #expect([(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.count == 729)
}
@Test("[(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)]")
func sdfgsdfg(){
    #expect([(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.count == 2187)
}
@Test("[(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)]")
func ewsdfsf(){
    #expect([(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.count == 6561)
}
@Test("[(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)]")
func sdfsdf(){
    #expect([(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.count == 19683)
}
@Test("[(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)]")
func sdfsdfss(){
    #expect([(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.count == 59049)
}
