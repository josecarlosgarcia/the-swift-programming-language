import UIKit

//: ## Structures and Classes

//: ## Comparing Structures and Classes

/*
Structures and classes in Swift have many things in common. Both can:
- Define properties to store values
- Define methods to provide functionality
- Define subscripts to provide access to their values using subscript syntax
- Define initializers to set up their initial state
- Be extended to expand their functionality beyond a default implementation
- Conform to protocols to provide standard functionality of a certain kind
*/

/*
Classes have additional capabilities that structures don’t have:
- Inheritance enables one class to inherit the characteristics of another.
- Type casting enables you to check and interpret the type of a class instance at runtime.
- Deinitializers enable an instance of a class to free up any resources it has assigned.
- Reference counting allows more than one reference to a class instance.
*/

//: ## Definition Syntax

struct SomeStructure {
    
}

class SomeClass {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//: ## Structure and Class Instances

let someResolution = Resolution()
let someVideMode = VideoMode()

//: ## Accesing Properties

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode \(someVideMode.resolution.width)")
someVideMode.resolution.width = 1280
print("The width of someVideoMode \(someVideMode.resolution.width)")

//: ## Memberwise Initializers for Structure Types

let vga = Resolution(width: 640, height: 480)

//: ## Structures and Enumerations Are Value Types

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case north, south, east, west
    
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

//: ## Classes Are Reference Types

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//: ## Identity Operators

// Identical to means thay two constants or variables of class type refer exactly
// the same class instance.
if tenEighty === alsoTenEighty {
    print("tenEighty an alsoTenEighty refer to the same VideoMode instance.")
}
