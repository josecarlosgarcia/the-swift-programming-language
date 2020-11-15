//: ## Access Control

//: ## Modules and Source Files

/*:
 - A module is a single unit of code distribution—a framework or application that is built and shipped
 as a single unit and that can be imported by another module with Swift’s import keyword.
 
 - A source file is a single Swift source code file within a module (in effect, a single file within
 an app or framework). Although it’s common to define individual types in separate source files,
 a single source file can contain definitions for multiple types, functions, and so on.
 */

//: ## Acess Levels

/*:
 - Open access and public access enable entities to be used within any source file from their
 defining module, and also in a source file from another module that imports the defining module.
 You typically use open or public access when specifying the public interface to a framework.
 The difference between open and public access is described below.

 - Internal access enables entities to be used within any source file from their defining module,
 but not in any source file outside of that module. You typically use internal access when defining
 an app’s or a framework’s internal structure.

 - File-private access restricts the use of an entity to its own defining source file.
 Use file-private access to hide the implementation details of a specific piece of functionality
 when those details are used within an entire file.

 - Private access restricts the use of an entity to the enclosing declaration, and to extensions
 of that declaration that are in the same file. Use private access to hide the implementation
 details of a specific piece of functionality when those details are used only within a single
 declaration.
 */

//: ## Access Control Syntax

/*
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}
*/

class SomeInternalClassDefault {}              // implicitly internal
let someInternalConstantDefault = 0            // implicitly internal”

//: ## Custom Types

public class SomePublicClass {                   // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                        // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {         // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                 // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}

//: ## Tuple Types

/*:
 Tuple types don’t have a standalone definition in the way that classes, structures, enumerations, and functions do. A tuple type’s access level is determined automatically from the types that make up the tuple type, and can’t be specified explicitly.
 */

//: ## Function Types

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
    return (SomeInternalClass(), SomePrivateClass())
}

//: ## Enumeration Types

public enum CompassPoint {
    case north
    case south
    case east
    case west
}

//: ## Subclassing

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

//: ## Constants, Variables, Properties, and Subscripts

private var privateInstance = SomePrivateClass()

//: ## Getters and Setters

public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

//: ## Extensions

struct SomeStruct {
    private var privateVariable = 12
}
    
protocol SomeProtocol {
    func doSomething()
}

extension SomeStruct: SomeProtocol {
    
    func doSomething() {
        print(privateVariable)
    }
}

