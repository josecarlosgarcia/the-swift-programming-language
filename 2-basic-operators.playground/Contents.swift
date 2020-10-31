import UIKit

//: ## Terminology

// -a, !b, b!   -> Unary operator
// 2 + 3        -> Binary operator
// a ? b : c    -> Ternary operator

//: ## Assignment Operator

let b = 10
var a = 5
a = b
let (x, y) = (1, 2)

//: ## Arithmetic Operators

1 + 2
5 - 3
2 * 3
10.00 / 2.5

"hello " + "world"

//: ## Remainder Operator

9 % 4   // 9 = (4 x 2) + 1
-9 % 4  // -9 = (4 x -2) - 1

//: ## Unary Minus Operator

let three = 3
let minusThree = -three     // minusThree equals -3
let plusThree = -minusThree // plusThree equals 3, or "minus minus three”

//: ## Unary Plus Operator

let minusSix = -6
let alsoMinusSix = +minusSix

//: ## Compound Assignment Operators

var c = 1
c += 2  // a = a + 2 shorthand

//: ## Comparison Operators

a == b
a != b
a > b
a < b
a >= b
a <= b
// a === b // identity operator
// a !== b

1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}

(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"

//: ## Ternary Conditional Operator

// Shorthand for the code below
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

/*
let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
*/

//: ## Nil-Coalescing Operator

// Normal
let d: Int? = nil
let e: Int = 1337
d != nil ? d! : e

// Shorthand
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

//: ## Range Operators

//: ## Closed Range Operator

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//: ## Half-Open Range Operator

let names = ["Ana", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

//: ## One-Sided Ranges

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)

//: ## Logical Operatos

//: ## Logical NOT Operator

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

//: ## Logical AND Operator

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ## Logical OR Operator

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ## Combining Logical Operators

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

//: ## Explicit Parenthesis

// Readability over brevety
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

