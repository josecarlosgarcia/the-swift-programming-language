//: ## Inheritance

//: ## Defining a Base Class

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//: ## Subclassing

class SomeSuperclass {

}

class SomeSubClass: SomeSuperclass {
    // subclass definition goes here
}

class Bicycle: Vehicle {
    var hasBasquet = false
}

let bicycle = Bicycle()
bicycle.hasBasquet = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasquet = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 23.0
print("Tandem: \(tandem.description)")

//: ## Overriding

//: ## Accesing Superclass Methods, Properties, and Subscripts

// This is by using the super prefix such as super.someMethod()

//: ## Overriding Methods

class Train: Vehicle {
    
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//: ## Overriding Properties

//: ## Overriding Property Getters and Setters

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

//: ## Overriding Property Observers

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//: ## Preventing Overrides

/*
Do this by writing the final modifier before the method, property,
or subscript’s introducer keyword (such as final var, final func,
final class func, and final subscript, even final class and you
won't be able to subclass a final class).
*/
