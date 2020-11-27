//: ## Initialization

//: ## Setting Initial Values for Stored Properties

//: ## Initializers

/*
init() {
    // perform some initialization here
}
*/

struct Fahrenheit {
    var temperature: Double

    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Farenheit")

//: ## Default Property Values

struct FahrenheitDefaultValue {
    var temperature = 32.0
}

//: Customizing Initialization

// Initializing Parameters

struct Celsius {
    var temperatureInCelcius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelcius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelcius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelcius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelcius

//: ## Parameter Names and Argument Labels

struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        self.red = white
        self.green = white
        self.blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//: ##Initializer Parameters Without Argument Labels

struct Celsius2 {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius2(37.0)

//: ##Optional Property Types

class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I dol like cheese."
cheeseQuestion.text = "Dev"
cheeseQuestion.ask()

//: ## Assigning Constant Properties During Initialization

class SurveyQuestion2 {
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But not with cheese.)"
// beetsQuestion.text = "Dev" // Runtime error

//: ## Default Initializers

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//: ## Memberwise Initializers for Structure Types

struct Size {
    var width = 0.0, height  = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

let zeroByTwo = Size(height:  2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size()
print(zeroByZero.width, zeroByZero.height)

//: ## Initializer Delegation for Value Types

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() { }
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print(basicRect)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))
print(originRect)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print(centerRect)

//: ## Class Inheritance and Initialization

//: ## Designated Initializers and Convenience Initializers

// Just apply for classes, not structs

//: ## Syntax for Designated and Convenience Initializers

/*
    init(parameters) {
        statements
    }
    
    convenience init(parameters) {
        statements
    }
*/

//: ## Initializer Delegation for Class Types

// Designated initializers must always delegate up.
// Convenience initializer must always delegate across.

//: ## Two-Phase Initialization

//: ## Initializer Inheritance and Overriding

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print(vehicle.description)

class Bicycle: Vehicle {

    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    
    init(color: String) {
        self.color = color
        //self.init() implicitly called here
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")

//: ## Automatic Initializer Inheritance

//: ## Designated and Convenience Initializers in Action

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print(namedMeat.name)

let misteryMeat = Food()
print(misteryMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.name)
let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.name)
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name)

class ShoppingListItemSubclass: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItemSubclass(),
    ShoppingListItemSubclass(name: "Bacon"),
    ShoppingListItemSubclass(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}

//: ## Failable Initializers

let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

struct Animal {
    let species: String
    
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//: ## Failable Initializers for Enumerations

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

//: ## Failable Initializers for Enumerations with Raw Values

enum TemperatureUnitRaw: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnitRaw = TemperatureUnitRaw(rawValue: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnitRaw = TemperatureUnitRaw(rawValue: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

//: ## Propagation of Initialization Failure

class Propagation {
    let name: String
    
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Propagation {
    let quantity: Int
    
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}

//: ## Overriding a Failable Initializer

class Document {
    var name: String?
    
    // this initializer creates a document with a nil name value
    init() {}
    
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    
    override init() {
        super.init(name: "[Untitled]")!
    }
}

//: ## The init! Failable Initializer

// init!

//: ## Required Initializers

class SomeClass {
    
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubclass: SomeClass {
    
    required init() {
        // initializer implementation goes here
    }
}

//: ## Setting a Default Property Value with a Closure or Function

/*
class SomeOtherClass {
    let someProperty: SomeType = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return someValue
    }()
}
*/

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        
        return temporaryBoard
    }()
    
    func squarelsBackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squarelsBackAt(row: 0, column: 1))
print(board.squarelsBackAt(row: 7, column: 7))
print(board.boardColors)
