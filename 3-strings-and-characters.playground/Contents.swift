import UIKit

//: ## String Literals

let someString = "Some string literal value"

//: ## Multiline String Literals

// With line-break
let multiQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop.
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

// Without line-break
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// Line feed
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

// Indentation
let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with four spaces.
    This line doesn't begin with whitespace.
    """

//: ## Special Characters in String Literals

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

//: ## Extended String Delimiters

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

//: Initializing an Empty String

// the two strings are both empty, and are equivalent each other
var emptyString = ""                // empty string literal
var anotherEmptyString = String()   // initializer syntax

if emptyString.isEmpty {
    print("Nothing to see here")
}

//: ## String Mutability

var variableString = "Horse"
variableString += " and carriage"

// Not mutable
let constantString = "Highlander"
//constantString += " and another Highlander"

//: ## Strings Are Value Types

//: ## Working with Characters

for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

//: ## Concatenating String and Characters

let string1 = "hello"
let string2 = " there"
var welcomeMessage = string1 + string2

var instruction = "look over"
instruction += string2

welcomeMessage.append(exclamationMark)

let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)

let goodStart = """
one
two

"""
print(goodStart + end)

//: ## String Interpolation

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6*7)."#)

//: ## Unicode

//: ## Extended Grapheme Clusters

let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let rollerCoaster: Character = "\u{1F3A2}"

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301
print("the number of characters in \(word) is \(word.count)")

//: ## Accessing and Modifying a String

//: ## String Indices

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

// greeting[greeting.endIndex] Runtime error
// greeting.index(after: greeting.endIndex) Runtime error

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

//: ## Inserting and Removing

var welcome = "hello"

welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

//: ## Substrings

let helloWord = "Hello, world!"
let helloIndex = helloWord.firstIndex(of: ",") ?? helloWord.endIndex
let beginning = helloWord[..<helloIndex]
// Convert the result to a String for long-term storage.
let newString = String(beginning)

//: ## Comparing Strings

//: ## String and Character Equality

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}

//: ## Prefix and Suffix Equiality

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

//: ## Unicode Representations of Strings

let dogString = "Dog!!🐶"

//: ## UTF-8 Representation

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

//: ## UTF-16 Representation

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

//: ## Unicode Scalar Representation

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar)")
}
