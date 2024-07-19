//
//  !.swift
//  
//
//  Created by Coen ten Thije Boonkkamp on 06/11/2022.
//

import Foundation

public prefix func !<A>(_ closure: @escaping (A) -> Bool) -> (A) -> Bool {
    { a in
        !closure(a)
    }
}


