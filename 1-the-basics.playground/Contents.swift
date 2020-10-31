import UIKit

//: ## Declaring Constants and Variables
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0

//: ## Type Annotations

var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double

//: ## Naming Constants and Variables

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour!"
// This is a compile-time error: languageName cannot be changed.
let languageName = "Swift"
//languageName = "Swift++"

//: ## Printing Constants and Variables

print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

//: ## Comments

// This is a comment.
/* This is also a comment
 but is written over multiple lines. */
/* This is the start of the multiline comment.
/* This is the second, nested multiline comment. */
This is the end of the first multiline comment */

//: ## Semicolons

let cat = "🐱"; print(cat)

//: ## Integer Bounds

// Signed Int
let minValue8 = Int8.min
let maxValue8 = Int8.max
let minValue16 = Int16.min
let maxValue16 = Int16.max
let minValue32 = Int32.min
let maxValue32 = Int32.max
let minValue64 = Int64.min
let maxValue64 = Int64.max
// Unsigned Int
let minValueU8 = UInt8.min
let maxValueU8 = UInt8.max
let minValueU16 = UInt16.min
let maxValueU16 = UInt16.max
let minValueU32 = UInt32.min
let maxValueU32 = UInt32.max
let minValueU64 = UInt64.min
let maxValueU64 = UInt64.max
// Int
let minValue = Int.min
let maxValue = Int.max

//: ## Floating-Point Numbers

// 64-Bit
let double: Double
// 32-Bit
let float: Float

//: ## Type Safety and Type Inference
let meaningOfLife = 42          // inferred to be of type Int
let pi = 3.14159                // inferred to be of type Double
let anotherPi = 3 + 0.14159     // inferred to be of type Double

//: ## Numeric Literals

let decimalInteger = 17
let binaryInteger = 0b10001     // 17 in binary notation
let octalInteger = 0o21         // 17 in octal notation
let hexadecimalInteger = 0x11   // 17 in hexadecimal notation”

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//: ## Numeric Type Conversion

/*
let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error
*/

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

//: ## Integer and Floating-oint Conversion

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pii = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pii)

//: ## Type Alises

typealias AudioSample = UInt16
var maxAmplitudFound = AudioSample.min

//: ## Booleans

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible")
}

//: ## Tuples

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
let http200Status = (statusCode: 200, statusMessage: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.statusMessage)")

//: ## Optionals

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // convertedNumber is inferred to be of type "Int?", or "optional Int"
var serverResponseCode: Int? = 404 // serverResponseCode contains an actual Int value of 404
serverResponseCode = nil // serverResponseCode now contains no value
var surveyAnswer: String? //surveryAnswer is automatically set to nil

//: ## If Statement and Force Unwrapping

if convertedNumber != nil {
    print("convertedNumber contains some integet value")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

//: ## Optional Binding

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//: ## Implicitly Unwrapped Optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point

let optionalString = assumedString // The type of optionalString is "String?" and assumedString isn't force-unwrapped

if assumedString != nil {
    print(assumedString!)
}

if let definiteString = assumedString {
    print(definiteString)
}

//: ## Error Handling

func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

func makeASandwich() throws {
    // ..
    throw SandwichError.outOfCleanDishes
}

func eatASandwich() {
    // ..
}

func whashDishes() {
    print("Washing dishes...")
}

func buyGroceries(_ ingredients: [String]) {
    // ..
}

enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients(ingredients: [String])
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    whashDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

//: ## Assertions and Preconditions

/*:
Assertions and preconditions are checks that happen at runtime. You use them to make sure an essential condition is satisfied before executing any further code.
*/

//: Debbuging with Assertions

let age = 3
assert(age >= 3, "A person's age can't be less than zero.")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    // if code already checks the condition
    assertionFailure("A person's age can't be less than zero.")
}

//: ## Enforcing Preconditions

// In the implementation of a subscript...
precondition(index > 0, "Index must be greater than zero.")
