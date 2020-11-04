import UIKit

//: ## Collection Types

//: ## Arrays

//: ## Array Type Shorthand Syntax

var someIntsFull = Array<Int>() // full syntax

//: ## Creating an Empty Array

var someInts = [Int]() // shorthand syntax
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = []

//: ## Creating an Array with Default Value

var threeDoubles = Array(repeating: 0.0, count: 3)

//: ## Creating an Array by Adding Two Arrays Together

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//: ## Creating an Array with an Array Literal

var shoppingList: [String] = ["Eggd", "Milk"]
var shoppingListInfered = ["Eggs", "Milk"]

//: ## Accesing and Modifying an Array

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
// first is equel to "Eggs"

shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"

print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)
// Replace range of items

shoppingList.insert("Mapple Syrup", at: 0)

let mappleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]
// firstItem is now equals to "Six eggs"

let apples = shoppingList.removeLast()

//: ## Iterating Over an Array

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//: ## Sets

//: ## Set Type Syntax

let set = Set<Int>()

//: ## Creating and Initializing an Empty Set

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
letters = []

//: ## Creating a Set with an Array Literal

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip Hop"]
var favoriteGenresInfered: Set = ["Rock", "Classical", "Hip Hop"] // Infered

//: ## Accesing and modifying a Set

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here")
}

//: ## Iterating Over a Set

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//: ## Performing Set Operations

//: ## Fundamental Set Operations

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

//: ## Dictionaries

//: ## Dictionary Type Shorthand Syntax

let fullDictionary = Dictionary<String, String>() // full syntax
let shorthandDictionary = [String: String]() // shorthand syntax

//: ## Creating an Empty Dictionary

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

//: ## Creating a Dictionary with a Dictionary Literal

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: ## Accessing and Modifying a Dictionary

print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"
// adding a key - value pair

airports["LHR"] = "London Heathrow"
// modifying an element

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil
// APL has now been removed from the dictionary

// removing a key-value pair with removeValue(forKey:)
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

//: ## Iterating Over a Dictionary

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// initializing an array with key or values from a dictionary

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// iterating a dictionary in order

for (airportCode) in airports.keys.sorted() {
    print("\(airportCode)")
}
