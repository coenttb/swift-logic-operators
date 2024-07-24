# Swift Logic Operators

Swift Logic Operators provides logical operators for optional Boolean values and Predicates.

## Features

- Logical NOT (`!`) for Predicates and optional Booleans
- Logical AND (`&&`) for Predicates and optional Booleans
- Logical OR (`||`) for Predicates and optional Booleans
- Logical NAND (`!&&`) for optional Booleans
- Logical NOR (`!||`) for optional Booleans
- Logical XOR (`^`) for Predicates and optional Booleans
- Logical XNOR (`!^`) for optional Booleans
- Equality (`==`) and Inequality (`!=`) comparisons for Predicates and optional values

## Usage

### Logical Operators for Optional Booleans

#### NOT (`!`)

Performs a logical NOT operation on an optional Boolean value.

```swift
!true  == false
!false == true
!nil   == nil
```

#### AND (`&&`)

Performs a logical AND operation between two optional Boolean values.

```swift
true && false  == false
true && nil    == nil
false && nil   == nil
false && false == false
true && true   == true
```

#### NAND (`!&&`)

Performs a logical NAND operation between two optional Boolean values.

```swift
true !&& false  == true
true !&& nil    == nil
false !&& nil   == nil
false !&& false == true
true !&& true   == false
nil && nil    == nil
```

#### OR (`||`)

Performs a logical OR operation between two optional Boolean values.

```swift
true || false   == true
true || nil     == true
false || nil    == nil
false || false  == false
nil || nil      == nil
```

#### NOR (`!||`)

Performs a logical NOR operation between two optional Boolean values.

```swift
true !|| false  == false
true !|| nil    == nil
false !|| nil   == nil
false !|| false == true
nil !|| nil     == nil
```

#### Equality (`==`)

Checks for equality between two optional Boolean values.

```swift
true == false == false
true == true  == true
true == nil   == nil
nil == nil    == nil
```

#### Inequality (`!=`)

Checks for inequality between two optional Boolean values.

```swift
true != false == true
true != true  == false
true != nil   == nil
nil != nil    == nil
```

#### XOR (`^`)

Performs a logical XOR operation between two optional Boolean values.

```swift
true ^ false   == true
true ^ nil     == nil
false ^ nil    == nil
false ^ false) == false
```

#### XNOR (`!^`)

Performs a logical XNOR operation between two optional Boolean values.

```swift
true !^ false  == false
true !^ nil    == nil
false !^ nil   == nil
false !^ false == true
```

### Logical Operators for Predicates

#### AND (`&&`)

Performs a logical AND operation between two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenAndPositive = isEven && isPositive

isEvenAndPositive(4)  == true
isEvenAndPositive(-4) == false
isEvenAndPositive(3)  == false
isEvenAndPositive(-3) == false
```

#### OR (`||`)

Performs a logical OR operation between two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isNegative: (Int) -> Bool = { $0 < 0 }
let isEvenOrNegative = isEven || isNegative

isEvenOrNegative(4)  == true
isEvenOrNegative(-4) == true
isEvenOrNegative(3)  == false
isEvenOrNegative(-3) == true
```

#### NOT (`!`)

Performs a logical NOT operation on the result of a Boolean-returning closure.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isOdd = !isEven

isEven(4) = true
isOdd(4)  = false
isEven(5) = false
isOdd(5)  = true
```

#### EQUAL (`==`)

Performs a logical equality check between the results of two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenAndPositiveEqual = isEven == isPositive

isEvenAndPositiveEqual(4)  == false
isEvenAndPositiveEqual(-4) == false
isEvenAndPositiveEqual(3)  == false
isEvenAndPositiveEqual(-3) == true
```

#### NOT EQUAL (`!=`)

Performs a logical inequality check between the results of two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenAndPositiveDifferent = isEven != isPositive

isEvenAndPositiveDifferent(4)  = true
isEvenAndPositiveDifferent(-4) = true
isEvenAndPositiveDifferent(3)  = true
isEvenAndPositiveDifferent(-3) = false
```

#### XOR (`^`)

Performs a logical XOR (exclusive OR) operation between two Boolean-returning closures.

```swift
let isEven: (Int) -> Bool = { $0 % 2 == 0 }
let isPositive: (Int) -> Bool = { $0 > 0 }
let isEvenOrPositive = isEven ^ isPositive

isEvenOrPositive(4)  == false
isEvenOrPositive(-4) == true
isEvenOrPositive(3)  == true
isEvenOrPositive(-3) == false
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
