import UIKit

//: ## Properties

//: ## Stored Properties

struct FixedLenghtRange {
    var firstValue: Int
    let lenght: Int
}

var rangeOfThreeItems = FixedLenghtRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6

//: ## Stored Properties of Constant Structure Instances

let rangeOfFourItems = FixedLenghtRange(firstValue: 0, lenght: 4)
// rangeOfFourItems.firstValue = 6
// This will report an error, even though firstValue is a variable property
// When an instance of a value type is marked as a constant, so are all of its properties

//: ## Lazy Stored Properties

/*
A lazy stored property is a property whose initial value is not calculated until the
first time it is used. You indicate a lazy stored property by writing the lazy
modifier before its declaration.
*/

class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created

//: ## Stored Properties and Instance Variables ??

//: # Computed Properties

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print(initialSquareCenter)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at \(square.origin.x), \(square.origin.y)")

//: ## Shorthand Setter Declaration

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            // default name newValue is used
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: ## Shorthand Getter Declaration

struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//: ## Read-Only Computed Properties

struct Cuboid {
    var width = 0.0, height = 0.0, depht = 0.0
    var volume: Double {
        return width * height * depht
    }
}

let fourByFiveByTwo = Cuboid(width: 4, height: 5, depht: 2)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//: ## Property Observers

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            // oldValue is the default name when none is set
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

//: ## Property Wrappers

@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

struct SmallRectangles {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set  { _width.wrappedValue = newValue }
    }
}

var rectangles = SmallRectangles()
rectangles.height

//: ## Setting Initial Values for Wrapped Properties

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.width, zeroRectangle.height)

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.width, unitRectangle.height)

struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)

//: ## Protecting a Value From a Property Wrapper

@propertyWrapper
struct SmallNumberProjected {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumberProjected var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)

enum Sizes {
    case small, large
}

struct SizedRectangle {
    @SmallNumberProjected var height: Int
    @SmallNumberProjected var width: Int
    
    mutating func resize(to size: Sizes) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

//: ## Global and Local Variables

/*
Global constants and variables are always computed lazily, in a similar manner to
Lazy Stored Properties. Unlike lazy stored properties, global constants and variables
do not need to be marked with the lazy modifier.

Local constants and variables are never computed lazily.
*/

//: ## Type Property Syntax

struct SomeOtherStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 3
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 101
    }
}

//: ## Querying and Setting Type Properties

print(SomeOtherStructure.storedTypeProperty)
SomeOtherStructure.storedTypeProperty = "Another value."
print(SomeOtherStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
