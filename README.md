# Swift Logic Operators

Swift Logic Operators provides custom logical operators for optional Boolean values.

## Features

- Logical AND (`?`) for optional Booleans
- Logical OR (`||`) for optional Booleans
- Logical NAND (`&&!`) for optional Booleans
- Logical NOR (`||!`) for optional Booleans
- Logical XOR (`^`) for optional Booleans
- Logical XNOR (`^!`) for optional Booleans
- Logical NOT (`!`) for optional Booleans
- Equality (`==`) and Inequality (`!=`) comparisons for optional values

## Usage

### Logical Operators for Optional Booleans

#### AND (`?`)

Performs a logical AND operation between two optional Boolean values.

```swift
let result = true ?? false  // result is false
let result = true ?? nil    // result is nil
let result = nil ?? true    // result is nil
```

#### OR (`||`)

Performs a logical OR operation between two optional Boolean values.

```swift
let result = true ||? false  // result is true
let result = true ||? nil    // result is nil
let result = nil ||? true    // result is nil
```

#### NAND (`&&!`)

Performs a logical NAND operation between two optional Boolean values.

```swift
let result = true &&! false  // result is true
let result = true &&! nil    // result is nil
let result is nil &&! true   // result is nil
```

#### NOR (`||!`)

Performs a logical NOR operation between two optional Boolean values.

```swift
let result = true ||! false  // result is false
let result = true ||! nil    // result is nil
let result = nil ||! true    // result is nil
```

#### XOR (`^`)

Performs a logical XOR operation between two optional Boolean values.

```swift
let result = true ^? false  // result is true
let result = true ^? nil    // result is nil
let result = nil ^? true    // result is nil
```

#### XNOR (`^!`)

Performs a logical XNOR operation between two optional Boolean values.

```swift
let result = true ^! false  // result is false
let result = true ^! nil    // result is nil
let result = nil ^! true    // result is nil
```

#### NOT (`!`)

Performs a logical NOT operation on an optional Boolean value.

```swift
let result = !(true)    // result is false
let result = !(false)   // result is true
let result = !(nil)     // result is nil
```

### Comparison Operators for Optional Values

#### Equality (`==`)

Compares an optional value with a non-optional value for equality.

```swift
let result = true ==? true   // result is true
let result = true ==? false  // result is false
let result = nil ==? true    // result is nil
```

#### Inequality (`!=`)

Compares an optional value with a non-optional value for inequality.

```swift
let result = true != false  // result is true
let result = true != true   // result is false
let result = nil != true    // result is nil
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
