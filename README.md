# Swift Logic Operators

Swift Logic Operators provides logical operators for optional Boolean values and Predicates.

## Features

- Logical AND (`?`) for Predicates and optional Booleans
- Logical OR (`||`) for Predicates and optional Booleans
- Logical NAND (`!&&`) for optional Booleans
- Logical NOR (`!||`) for optional Booleans
- Logical XOR (`^`) for Predicates and optional Booleans
- Logical XNOR (`!^`) for optional Booleans
- Logical NOT (`!`) for Predicates and optional Booleans
- Equality (`==`) and Inequality (`!=`) comparisons for Predicates and optional values

## Usage

### Logical Operators for Optional Booleans

#### NOT (`!`)

Performs a logical NOT operation on an optional Boolean value.

```swift
print(!true)  // Prints "Optional(false)"
print(!false) // Prints "Optional(true)"
print(!nil)   // Prints "nil"
```

#### AND (`&&`)

Performs a logical AND operation between two optional Boolean values.

```swift
print(true && false)    // Prints "Optional(false)"
print(true && nil)      // Prints "nil"
print(false && nil)     // Prints "nil"
print(false && false)   // Prints "Optional(false)"
print(true && true)     // Prints "Optional(true)"
```

#### NAND (`!&&`)

Performs a logical NAND operation between two optional Boolean values.

```swift
print(true !&& false)   // Prints "Optional(true)"
print(true !&& nil)     // Prints "nil"
print(false !&& nil)    // Prints "nil"
print(false !&& false)  // Prints "Optional(true)"
print(true !&& true)    // Prints "Optional(false)"
```

#### OR (`||`)

Performs a logical OR operation between two optional Boolean values.

```swift
print(true || false)    // Prints "Optional(true)"
print(true || nil)      // Prints "Optional(true)"
print(false || nil)     // Prints "nil"
print(false || false)   // Prints "Optional(false)"
print(nil || nil)       // Prints "nil"
```

#### NOR (`!||`)

Performs a logical NOR operation between two optional Boolean values.

```swift
print(true !|| false)   // Prints "Optional(false)"
print(true !|| nil)     // Prints "nil"
print(false !|| nil)    // Prints "nil"
print(false !|| false)  // Prints "Optional(true)"
print(nil !|| nil)      // Prints "nil"
```

#### Equality (`==`)

Checks for equality between two optional Boolean values.

```swift
print(true == false) // Prints "Optional(false)"
print(true == true)  // Prints "Optional(true)"
print(true == nil)   // Prints "nil"
print(nil == nil)    // Prints "nil"
```

#### Inequality (`!=`)

Checks for inequality between two optional Boolean values.

```swift
print(true != false) // Prints "Optional(true)"
print(true != true)  // Prints "Optional(false)"
print(true != nil)   // Prints "nil"
print(nil != nil)    // Prints "nil"
```

#### XOR (`^`)

Performs a logical XOR operation between two optional Boolean values.

```swift
print(true ^ false)  // Prints "Optional(true)"
print(true ^ nil)    // Prints "nil"
print(false ^ nil)   // Prints "nil"
print(false ^ false) // Prints "Optional(false)"
```

#### XNOR (`!^`)

Performs a logical XNOR operation between two optional Boolean values.

```swift
print(true !^ false)  // Prints "Optional(false)"
print(true !^ nil)    // Prints "nil"
print(false !^ nil)   // Prints "nil"
print(false !^ false) // Prints "Optional(true)"
```

### Logical Operators for Predicates

Here are the sections for each operator based on the provided files:

#### AND (`&&`)

Performs a logical AND operation between two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenAndPositive = isEven && isPositive

print(isEvenAndPositive(4))  // true
print(isEvenAndPositive(-4)) // false
print(isEvenAndPositive(3))  // false
print(isEvenAndPositive(-3)) // false
```

#### OR (`||`)

Performs a logical OR operation between two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isNegative: (Int) -> Bool = { $0 < 0 }
let isEvenOrNegative = isEven || isNegative

print(isEvenOrNegative(4))  // true
print(isEvenOrNegative(-4)) // true
print(isEvenOrNegative(3))  // false
print(isEvenOrNegative(-3)) // true
```

#### NOT (`!`)

Performs a logical NOT operation on the result of a Boolean-returning closure.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isOdd = !isEven

print(isEven(4))  // true
print(isOdd(4))   // false
print(isEven(5))  // false
print(isOdd(5))   // true
```

#### EQUAL (`==`)

Performs a logical equality check between the results of two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenAndPositiveEqual = isEven == isPositive

print(isEvenAndPositiveEqual(4))  // false
print(isEvenAndPositiveEqual(-4)) // false
print(isEvenAndPositiveEqual(3))  // false
print(isEvenAndPositiveEqual(-3)) // true
```

#### NOT EQUAL (`!=`)

Performs a logical inequality check between the results of two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenAndPositiveDifferent = isEven != isPositive

print(isEvenAndPositiveDifferent(4))  // true
print(isEvenAndPositiveDifferent(-4)) // true
print(isEvenAndPositiveDifferent(3))  // true
print(isEvenAndPositiveDifferent(-3)) // false
```

#### XOR (`^`)

Performs a logical XOR (exclusive OR) operation between two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenOrPositive = isEven ^ isPositive

print(isEvenOrPositive(4))  // false
print(isEvenOrPositive(-4)) // true
print(isEvenOrPositive(3))  // true
print(isEvenOrPositive(-3)) // false
```

## Tests

This package includes comprehensive tests for all custom logical operators and functions. The tests ensure that the operators behave correctly with all possible combinations of optional Boolean values.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Installation

To install LogicOperators, add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-logic-operators.git", from: "0.1.0")
]
```

You can then make LogicOperators available to your package's target by including LogicOperators in the dependencies of any target in your package, as follows:
```swift
targets: [
    .target(
        name: "TheNameOfYourTarget",
        dependencies: [
            .product(name: "LogicOperators", package: "swift-logic-operators")
        ]
    )
]
```

Finally, import LogicOperators in your .swift file(s), as follows:
```swift
import LogicOperators

...your swift code...
```
