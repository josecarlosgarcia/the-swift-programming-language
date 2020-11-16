//:## Automatic Reference Counting

//: ## ARC in Action

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil // Deinitilized until all strong references are nil

//: ## Strong Reference Cycles Between Class Instances

class PersonStrong {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentStrong?
    deinit { print("\(name) is being deinitialized") }
}

class ApartmentStrong {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: PersonStrong?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: PersonStrong?
var unit4A: ApartmentStrong?

john = PersonStrong(name: "John Appleseed")
unit4A = ApartmentStrong(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

// Can't break the reference cycle
john = nil
unit4A = nil

//: ## Resolving Strong Reference Cycles Between Class Instances

//: ## Weak References

class PersonWeak {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentWeak?
    deinit { print("\(name) is being deinitialized") }
}

class ApartmentWeak {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: PersonWeak?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var jose: PersonWeak?
var unit3A: ApartmentWeak?

jose = PersonWeak(name: "José García")
unit3A = ApartmentWeak(unit: "3A")

jose!.apartment = unit3A
unit3A!.tenant = jose

// Break the cycle
jose = nil
unit3A = nil

//: ## Unowned References

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var carlos: Customer?
carlos = Customer(name: "José Carlos García")
carlos!.card = CreditCard(number: 1234_5678_9012_3456, customer: carlos!)

carlos = nil

//: ## Unowned Optional References

class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

let department = Department(name: "Horticulture")

let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)

intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]

//: ## Unowned References and Implicitly Unwrapped Optional Properties

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

//: ## Strong Reference Cycles for Closures

class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())

// Reference cycle beacause self is captured in closure
paragraph = nil

//: ## Resolving Strong Reference Cycles for Closures

//: ## Defining a Capture List

/*
class  SomeClass {
    
    var delegate: SomeProtocol?
    
    lazy var someClosure = {
        [unowned self, weak delegate = self.delegate]
        (index: Int, stringToProcess: String) -> String in
        // closure body
    }
}
*/

//: ## Weak and Unowned References

class HTMLElementGood {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

var article: HTMLElementGood? = HTMLElementGood(name: "article", text: "hello, world")
print(article!.asHTML())

// Reference cycle beacause self is captured in closure
article = nil
