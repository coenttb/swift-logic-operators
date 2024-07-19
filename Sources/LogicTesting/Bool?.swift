//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 08/07/2024.
//

import Foundation

// figure out if and how parameter packs can simplify this.

extension Bool?:@retroactive CaseIterable {
    public static var allCases: [Optional<Bool>] = [.some(true), .some(false), .none]
}

extension [Bool?] {
    public static let allCases: Self = [true, false, nil]
}

extension [(Bool?, Bool?)] {
    public static let allCases: Self = Bool?.allCases.flatMap { first in
        Bool?.allCases.map { second in
            (first, second)
        }
    }
}

extension [(Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?)].allCases.flatMap { (first, second) in
        Bool?.allCases.map { third in
            (first, second, third)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third) in
        Bool?.allCases.map { fourth in
            (first, second, third, fourth)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third, fourth) in
        Bool?.allCases.map { fifth in
            (first, second, third, fourth, fifth)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third, fourth, fifth) in
        Bool?.allCases.map { sixth in
            (first, second, third, fourth, fifth, sixth)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third, fourth, fifth, sixth) in
        Bool?.allCases.map { seventh in
            (first, second, third, fourth, fifth, sixth, seventh)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third, fourth, fifth, sixth, seventh) in
        Bool?.allCases.map { eighth in
            (first, second, third, fourth, fifth, sixth, seventh, eighth)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third, fourth, fifth, sixth, seventh, eighth) in
        Bool?.allCases.map { ninth in
            (first, second, third, fourth, fifth, sixth, seventh, eighth, ninth)
        }
    }
}

extension [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)] {
    public static let allCases: Self = [(Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?, Bool?)].allCases.flatMap { (first, second, third, fourth, fifth, sixth, seventh, eighth, ninth) in
        Bool?.allCases.map { tenth in
            (first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth)
        }
    }
}
