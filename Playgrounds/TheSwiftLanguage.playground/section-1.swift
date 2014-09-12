// Playground - noun: a place where people can play

import UIKit

// ------
// Variables and Constants
// BEGIN variables_and_constants
var myVariable = 123
let myConstantVariable = 123
// END variables_and_constants

#if os(NOPE)
// BEGIN changing_constant_var
myVariable += 5

// (ERROR: can't change a constant variable)
myConstantVariable += 2
// END changing_constant_var
#endif


#if os(NOPE)
    // BEGIN must_assign_value_to_constants
    let someConstant : Int
    // ERROR: constants must contain values when they're declared
    // END must_assign_value_to_constants
#endif

#if os(NOPE)
    // BEGIN cant_use_variables_before_they_have_value
    var someVariable : Int
    someVariable += 2
    // ERROR: someVariable doesn't have a value, so can't add 2 to it
    someVariable = 2
    someVariable += 2
    // WORKS, because someVariable has a value to add to
    // END cant_use_variables_before_they_have_value
#endif


// ------
// Types

// BEGIN implicit_type
// Implicit type of integer
var anInteger = 2
// END implicit_type

anInteger += 3

anInteger += Int(0.2)

var aFloat = 0.0

aFloat += 0.2

aFloat += 1

#if os(NOPE)
// BEGIN incompatible_types
// ERROR: Can't add a string to an integer
anInteger += "Yes"
// END incompatible_types
#endif

// BEGIN explicit_type
// Explicit type of integer
let anExplicitInteger : Int = 2
// END explicit_type

// BEGIN optional_type
// Optional integer, allowed to be nil
var anOptionalInteger : Int? = nil
anOptionalInteger = 42
// END optional_type

#if os(NOPE)
// BEGIN optional_type_error
// Non-optional (regular), NOT allowed to be nil
var aNonOptionalInteger = 42

aNonOptionalInteger = nil
// ERROR: only optional values can be nil
// END optional_type_error
#endif

// BEGIN optional_type_checking
if anOptionalInteger != nil {
    println("It has a value!")
} else {
    println("It has no value!")
}
// END optional_type_checking

// BEGIN optional_unwrapping
// Optional types must be unwrapped using !
anOptionalInteger = 2
1 + anOptionalInteger! // = 3

anOptionalInteger = nil
// 1 + anOptionalInteger!
// CRASH: anOptionalInteger = nil, can't use nil data
// END optional_unwrapping


// Optionals can also be declared unwrapped; this means you don't have to unwrap them later, but is unsafe
// BEGIN optional_declared_unwrapped
var unwrappedOptionalInteger : Int!
unwrappedOptionalInteger = 1
1 + unwrappedOptionalInteger // = 2
// END optional_declared_unwrapped

// Types can be converted
// BEGIN converting_types
let aString = String(anInteger)
// = "2"
// END converting_types

#if os(NOPE)
    // BEGIN cant_directly_convert_types
    // ERROR: Can't directly convert between types
    let aString = anInteger
    // END cant_directly_convert_types
#endif

if true {
// Tuples
// BEGIN tuples
let aTuple = (1, "Yes")
// END tuples

// BEGIN tuples_accessing
let theNumber = aTuple.0 // = 1
// END tuples_accessing
}

if true {
// BEGIN tuples_accessing_string
let aTuple = (aNumber: 1, aString: "Yes")

let theNumber = aTuple.aNumber // = 1
// END tuples_accessing_string
}

// ------
// Arrays

// BEGIN explicit_array
// Array of integers
let arrayOfIntegers : [Int] = [1,2,3]
// END explicit_array

// BEGIN implicit_array
// Type of array is implied
let implicitArrayOfIntegers = [1,2,3]
// END implicit_array

// BEGIN create_empty_array
// Can also create an empty array, but you have to provide the type
let anotherArray = [Int]()
// END create_empty_array

// Arrays can be immutable, like all other types
// BEGIN immutable_array
let immutableArray = [42,24]
// END immutable_array

// Adding values to arrays
// BEGIN appending_to_array
var myArray = [1,2,3]
myArray.append(4)
// = [1,2,3,4]
// END appending_to_array

// Getting the number of items in an array
// BEGIN array_count
myArray.count
// = 4
// END array_count

// Inserting values in arrays
// BEGIN inserting_in_array
myArray.insert(5, atIndex: 0)
// = [5,1,2,3,4]
// END inserting_in_array

// Removing items from arrays
// BEGIN removing_from_array
myArray.removeAtIndex(4)
// = [5,1,2,3]
// END removing_from_array

// Reversing an array
// BEGIN reversing_array
myArray.reverse()
// = [3,2,1,5]
// END reversing_array

// ------
// Dictionaries

// Creating a dictionary of string keys and string values
// BEGIN creating_dictionary
var crew = [
    "Captain": "Jean-Luc Picard",
    "First Officer": "William Riker",
    "Second Officer": "Data"
];
// END creating_dictionary

// Retrieving values from a dictionary
// BEGIN values_from_dict
crew["Captain"]
// = "Jean-Luc Picard"
// END values_from_dict

// Setting values in a dictionary
// BEGIN setting_values_in_dict
crew["Intern"] = "Wesley Crusher"
// END setting_values_in_dict

// Dictionaries can contain any type
// BEGIN integer_keys_in_dict
// This dictionary uses integers for both keys and values
var aNumberDictionary = [1: 2]
aNumberDictionary[21] = 23
// END integer_keys_in_dict

// ------
// Flow control (loops, if)

// BEGIN if_block
if 1+1 == 2 {
    "The math checks out"
}
// END if_block

// For loops a for-in loop
// BEGIN for_in_loop
let loopingArray = [1,2,3,4,5]
var loopSum = 0
for number in loopingArray {
    loopSum += number
}
loopSum // = 15 
// END for_in_loop

// Ranges can be ..< (exclusive) and ... (inclusive)
// BEGIN for_range_exclusive
var firstCounter = 0
for index in 1 ..< 10 {
    firstCounter++
}
// Loops 9 times
// END for_range_exclusive
"Looped \(firstCounter) times"

// BEGIN for_range_inclusive
var secondCounter = 0
for index in 1 ... 10 { // note the three dots, not two
    secondCounter++
}
// Loops 10 times
// END for_range_inclusive
"Looped \(secondCounter) times"

// Using a for-condition-increment loop
// BEGIN for_condition_increment
var sum = 0
for var i = 0; i < 3; i++ {
    sum += 1
}
sum // = 3
// END for_condition_increment

// While loop
// BEGIN while_loop
var countDown = 5
while countDown > 0 {
    countDown--
}
countDown // = 0
// END while_loop

// Do-while loop
// BEGIN do_while_loop
var countUp = 0
do {
    countUp++
} while countUp < 5
countUp // = 5
// END do_while_loop

// Using If-let to unwrap conditions
// BEGIN if_let
var conditionalString : String? = "a string"

if let theString = conditionalString? {
    "The string is \(theString)"
} else {
    "The string is nil"
}
// END if_let

// ------
// Switches

// Switching on an integer
// BEGIN switch_on_integer
let integerSwitch = 3

switch integerSwitch {
case 0:
    "It's 0"
case 1:
    "It's 1"
case 2:
    "It's 2"
default: // note: default is mandatory if not all cases are covered (or can be covered)
    "It's something else"
}
// END switch_on_integer

// Switching on a string
// BEGIN switch_on_string
let stringSwitch = "Hello"

switch stringSwitch {
case "Hello":
    "A greeting"
case "Goodbye":
    "A farewell"
default:
    "Something else"
}
// END switch_on_string

// Switching on a tuple
// BEGIN switch_on_tuple
let tupleSwitch = ("Yes", 123)

switch tupleSwitch {
case ("Yes", 123):
    "Tuple contains 'Yes' and '123'"
case ("Yes", _):
    "Tuple contains 'Yes' and something else"
default:
    break
}
// END switch_on_tuple

// Switching on a range
// BEGIN switch_on_range
var someNumber = 15

switch someNumber {
case 0...10:
    "Number is between 0 and 10"
case 11...20:
    "Number is between 11 and 20"
default:
    "Number is something else"
}
// END switch_on_range

// ------
// Functions

// Defining a function with no parameters and no return
// BEGIN function
func firstFunction() {
    "Hello"
}
firstFunction()
// END function

// Defining a function that returns a value
// BEGIN function_returning_value
func secondFunction() -> Int {
    return 123
}
secondFunction()
// END function_returning_value

// Defining a function that takes parameters
// BEGIN function_with_parameters
func thirdFunction(firstValue: Int, secondValue: Int) -> Int {
    return firstValue + secondValue
}
thirdFunction(1, 2)
// END function_with_parameters

// Functions can return multiple values, using a tuple
// BEGIN function_returning_tuple
func fourthFunction(firstValue: Int, secondValue: Int) -> (doubled: Int, quadrupled: Int) {
    return (firstValue * 2, secondValue * 4)
}
fourthFunction(2, 4)
// END function_returning_tuple

// If a returned tuple has named components (which is optional), you can refer
// to those components by name:
// BEGIN access_components_of_tuple
// Accessing by number:
fourthFunction(2, 4).1 // = 16
// Same thing but with names:
fourthFunction(2, 4).quadrupled // = 16
// END access_components_of_tuple

// Function parameters can be given names
// BEGIN function_with_parameter_names
func addNumbers(firstNumber num1 : Int, toSecondNumber num2: Int) -> Int {
    return num1 + num2
}

addNumbers(firstNumber: 2, toSecondNumber: 3) // = 5
// END function_with_parameter_names

// You can shorthand this by adding a #
// BEGIN function_with_shorthand_method_names
func multiplyNumbers(#firstNumber: Int, #multiplier: Int) -> Int {
    return firstNumber * multiplier
}
multiplyNumbers(firstNumber: 2, multiplier: 3) // = 6
// END function_with_shorthand_method_names

// Function parameters can have default values, as long as they're at the end
// BEGIN function_with_default_parameter_values
func multiplyNumbers2 (firstNumber: Int, multiplier: Int = 2) -> Int {
    return firstNumber * multiplier;
}
// Parameters with default values can be omitted
multiplyNumbers2(2) // = 4
// END function_with_default_parameter_values

// Functions can receive a variable number of parameters
// BEGIN function_with_variable_parameters
func sumNumbers(numbers: Int...) -> Int {
    // in this function, 'numbers' is an array of Ints
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
sumNumbers(2,3,4,5) // = 14
// END function_with_variable_parameters

// Functions can change the value of variables that get passed to them using 'inout'
// BEGIN function_using_inout_to_swap
func swapValues(inout firstValue: Int, inout secondValue: Int) {
    let tempValue = firstValue
    firstValue = secondValue
    secondValue = tempValue
}

var swap1 = 2
var swap2 = 3
swapValues(&swap1, &swap2)
swap1 // = 3
swap2 // = 2
// END function_using_inout_to_swap


// ------
// Closures and Function Types

// Functions can be stored in variables
// BEGIN storing_function_in_variable
var numbersFunc: (Int, Int) -> Int;
// numbersFunc can now store any function that takes two ints and returns an int
numbersFunc = addNumbers
numbersFunc(2, 3) // = 5
// END storing_function_in_variable

// Functions can receive other functions as parameters
// BEGIN function_receiving_function_as_parameter
func timesThree(number: Int) -> Int {
    return number * 3
}

func doSomethingToNumber(aNumber: Int, thingToDo: (Int)->Int) -> Int {
    // call the function 'thingToDo' using 'aNumber', and return the result
    return thingToDo(aNumber);
}

doSomethingToNumber(4, timesThree) // = 12
// END function_receiving_function_as_parameter

// Functions can return other functions
// BEGIN function_returning_function
func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {
        return number + numberToAdd
    }
    return adder
}
var addTwo = createAdder(2)
addTwo(2) // = 4
// END function_returning_function

// Functions can 'capture' values
// BEGIN function_capturing_values
func createIncrementor(incrementAmount: Int) -> () -> Int { // <1>
    var amount = 0 // <2>
    func incrementor() -> Int { // <3>
        amount += incrementAmount // <4>
        return amount 
    }
    return incrementor // <5>
}

var incrementByTen = createIncrementor(10) // <6>
incrementByTen() // = 10 <7>
incrementByTen() // = 20 

var incrementByFifteen = createIncrementor(15) // <8>
incrementByFifteen() // = 15 <9>
// END function_capturing_values

// You can write short, anonymous functions called 'closures'
// BEGIN using_closure_as_parameter
var numbers = [2,1,56,32,120,13]

var numbersSorted = sorted(numbers, { (n1: Int, n2: Int) -> Bool in
    // Sort so that small numbers go before large numbers
    return n2 > n1
}) // = [1, 2, 13, 32, 56, 120]
// END using_closure_as_parameter

// The types of parameters and the return type can be inferred
// BEGIN closure_with_inferred_parameter_types
var numbersSortedReverse = sorted(numbers, {n1, n2 in
    return n1 > n2
}) // = [120, 56, 32, 13, 2, 1]
// END closure_with_inferred_parameter_types

// If you don't care about the names of the parameters, use $0, $1, etc
// Also, if there's only a single line of code in the closure you can omit the 'return'
// BEGIN closure_with_anonymous_parameters_and_no_return_keyword
var numbersSortedAgain = sorted(numbers, {
    $1 > $0
}) // = [1, 2, 13, 32, 56, 120]
// END closure_with_anonymous_parameters_and_no_return_keyword

// If the last parameter of a function is a closure, you can put the braces outside the parentheses
// BEGIN closure_with_braces_outside_parentheses
var numbersSortedReversedAgain = sorted(numbers) {
    $0 > $1
} // = [120, 56, 32, 13, 2, 1]
// END closure_with_braces_outside_parentheses

// Closures can be stored in variables and used like functions
// BEGIN closure_stored_in_variable_and_called_like_function
var comparator = {(a: Int, b:Int) in a < b}
comparator(1,2) // = true
// END closure_stored_in_variable_and_called_like_function

// BEGIN sorting_inline
var sortingInline = [2, 5, 98, 2, 13]
sort(&sortingInline)
sortingInline // = [2, 2, 5, 13, 98]
// END sorting_inline

// ------
// Objects


// Classes define the 'blueprint' for an object
// BEGIN defining_class
class Vehicle {

// BEGIN properties_in_class
    var colour: String?
    var maxSpeed = 80
// END properties_in_class
    
// BEGIN functions_in_class
    func description() -> String {
        return "A \(self.colour) vehicle"
    }
    
    func travel() {
        println("Travelling at \(maxSpeed) kph")
    }
// END functions_in_class
}
// END defining_class

// BEGIN using_class
var redVehicle = Vehicle()
redVehicle.colour = "Red"
redVehicle.maxSpeed = 90
redVehicle.travel() // prints "Travelling at 90 kph"
redVehicle.description() // = "A Red vehicle"
// END using_class

// ------
// Inheritance

// Classes can inherit from other classes


// BEGIN inheritance
class Car: Vehicle {
    // Inherited classes can override functions
    // BEGIN overidden_function    
        override func description() -> String  {
            var description = super.description()
            return description + ", which is a car"
        }
    // END overidden_function
}

// END inheritance

// Classes have a special 'init' function
class Motorcycle : Vehicle {
    var manufacturer : String
    
    override func description() -> String  {
        return "A \(colour) \(manufacturer) bike"
    }
    
    // By the end of the init function, all variables that are not optional must have a value
    init(manufacturer: String = "No-Name Brand™")  {
        self.manufacturer = manufacturer
        
        // The superclass' init function must be called after all properties defined in this subclass have a value
        super.init()
        
        self.colour = "Blue"
        
    }
    
    // 'convenience' init functions let you set up default values, and must call the main init method first
    convenience init (colour : String) {
        self.init()
        self.colour = colour
    }
}

var firstBike = Motorcycle(manufacturer: "Yamaha")
firstBike.description() // = "A Blue Yamaha bike"

var secondBike = Motorcycle(colour: "Red")
secondBike.description() // = "A Red No-Name Brand™ bike"

// ------
// Properties

// Properties can be simple stored variables
// BEGIN property_example
class SimplePropertyExample {
    var number: Int = 0
}
let test1 = SimplePropertyExample()
test1.number = 2
// END property_example

// Properties can be computed
// BEGIN computed_property
class Rectangle {
    var width: Double = 0.0
    var height: Double = 0.0
    var area : Double {
        // computed getter
        get { 
            return width * height
        }
        
        // computed setter
        set {            
            // Assume equal dimensions (ie a square)
            width = sqrt(newValue)
            height = sqrt(newValue)
        }
    }
}
// END computed_property

// BEGIN accessing_computed_property
var rect = Rectangle()
rect.width = 3.0
rect.height = 4.5
rect.area // = 13.5
rect.area = 9 // width & height now both 3.0
// END accessing_computed_property

// You can run code when a property changes
// BEGIN property_observer
class PropertyObserverExample {
    var number : Int = 0 {
        willSet(newNumber) {
            println("About to change to \(newNumber)")
        }
        didSet(oldNumber) {
            println("Just changed from \(oldNumber) to \(self.number)!")
        }
    }
}
// END property_observer

// BEGIN property_observer_example
var observer = PropertyObserverExample()
observer.number = 4
// prints "About to change to 4", then "Just changed from 0 to 5!"

// END property_observer_example

// Properties can be made 'lazy': they aren't set up until they're first called

// BEGIN lazy_property
class SomeExpensiveClass {
    init(id : Int) {
        println("Expensive class \(id) created!")
    }
}

class LazyPropertyExample {
    var expensiveClass1 = SomeExpensiveClass(id: 1)
    // note that we're actually constructing a class,
    // but it's labelled as lazy
    lazy var expensiveClass2 = SomeExpensiveClass(id: 2)
    
    
    init() {
        println("First class created!")
    }
}

var lazyExample = LazyPropertyExample()
// prints "Expensive class 1 created", then "First class created!"

lazyExample.expensiveClass1 // prints nothing, it's already created
lazyExample.expensiveClass2 // prints "Expensive class 2 created!"
// END lazy_property


// ------
// Protocols

// Protocols are lists of methods and properties that classes can contain


// BEGIN protocols
protocol Blinking {
    
    // This property must be (at least) gettable
    var isBlinking : Bool { get }
    
    // This property must be gettable and settable
    var blinkSpeed: Double { get set }
    
    // This function must exist, but what it does is up to the implementor
    func startBlinking(blinkSpeed: Double) -> Void
}
// END protocols

// BEGIN conforming_to_protocol
class Light : Blinking {
    var isBlinking: Bool = false
    
    var blinkSpeed : Double = 0.0
    
    func startBlinking(blinkSpeed : Double) {
        println("I am now blinking")
        isBlinking = true
        self.blinkSpeed = blinkSpeed
    }
}
// END conforming_to_protocol

// BEGIN protocol_type
var aBlinkingThing : Blinking? 
// can be ANY object that has the Blinking protocol

aBlinkingThing = Light()
aBlinkingThing!.startBlinking(4.0) // prints "I am now blinking"
aBlinkingThing!.blinkSpeed // = 4.0
// END protocol_type

// ------
// Extensions

// Types can be extended to include new properties and methods

// BEGIN extending_int
extension Int {
    var doubled : Int {
        return self * 2
    }
    func multiplyWith(anotherNumber: Int) -> Int {
        return self * anotherNumber
    }
}
// END extending_int

// BEGIN using_int_extension
2.doubled // = 4
4.multiplyWith(32) // = 128
// END using_int_extension


// Types can also be made to conform to a protocol
// BEGIN extending_with_protocol
extension Int : Blinking {
    var isBlinking : Bool {
        return false;
    }
    
    var blinkSpeed : Double {
        get {
            return 0.0;
        }
        set {
            // Do nothing
        }
    }
    
    func startBlinking(blinkSpeed : Double) {
        println("I am the integer \(self). I do not blink.")
    }
}
2.isBlinking // = false
2.startBlinking(2.0) // prints "I am the integer 2. I do not blink."
// END extending_with_protocol

// Access control

// This class is visible to everyone

// BEGIN access_control_class
public class AccessControl {
// END access_control_class
    
    // BEGIN internal_property
    // Accessible to this module only
    // 'internal' here is the default and can be omitted
    internal var internalProperty = 123
    // END internal_property
    
    // BEGIN public_property
    // Accessible to everyone
    public var publicProperty = 123
    // END public_property
    
    // BEGIN private_property
    // Only accessible in this source file
    private var privateProperty = 123
    // END private_property
    
    // BEGIN private_setter_property
    // The setter is private, so other files can't modify it
    private(set) var privateSetterProperty = 123
    // END private_setter_property
}


// ------
// Interoperating with Objective-C

// Creating Objective-C objects
// BEGIN creating_objc_object
var view = UIView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
// END creating_objc_object

// Working with Objective-C properties
// BEGIN objc_property
view.bounds
// END objc_property

// Calling Objective-C methods
// BEGIN objc_method
view.pointInside(CGPoint(x: 20, y: 20), withEvent:nil) // = true
// END objc_method

// ------
// Modules

// BEGIN modules
import AVFoundation
// END modules

// ------
// Memory Management

// References to other classes are strong, but can be made explicitly weak
// BEGIN weak_reference
class Class1 {
    init() {
        println("Class 1 being created!")
    }
    
    deinit {
        println("Class 1 going away!")
    }
}

class Class2 {
    // Weak vars are implicitly optional
    weak var weakRef : Class1?
}
// END weak_reference

// ------
// Initialization and Deinitialisation

// BEGIN init_and_deinit
class InitAndDeinitExample {
    // Designated (i.e. main) initialiser
    init () {
        println("I've been created!")
    }
    // Convenience initialiser
    convenience init (text: String) {
        self.init() // this is mandatory
        println("I was called with the convenience initialiser!")
    }
    // Deinitialiser
    deinit {
        println("I'm going away!")
    }
}

var example : InitAndDeinitExample?

// using the designated initialiser
example = InitAndDeinitExample() // prints "I've been created!"
example = nil // prints "I'm going away"

// using the convenience initialiser
example = InitAndDeinitExample(text: "Hello") 
// prints "I've been created!" and then
//  "I was called with the convenience initialiser"
// END init_and_deinit

// ------
// Mutable and Immutable Objects

var mutableString = ""
let immutableString = "Yes"

mutableString += "Internet"
// immutableString += "Hello"
// ERROR: Can't modify an immutable object


// ------
// Working with Strings

// Strings can be empty
// BEGIN empty_string_1
let emptyString = ""
// END empty_string_1

// BEGIN empty_string_2
let anotherEmptyString = String()
// END empty_string_2

// You can check to see if a string is empty

// BEGIN checking_empty_string
emptyString.isEmpty // = true
// END checking_empty_string

// You can add strings together
// BEGIN composing_string
var composingAString = "Hello"
composingAString += ", World!" // = "Hello, World!"
// END composing_string

// You can loop over a string's characters
// BEGIN looping_over_string_contents
var reversedString = ""
for character in "Hello" {
    reversedString = String(character) + reversedString
}
reversedString // = "olleH"
// END looping_over_string_contents

// You can get the number of characters in a string
// BEGIN counting_elements_in_string
countElements("Hello") // = 5
// END counting_elements_in_string


// ------
// Comparing Strings

// Compare to see if two strings are the same text using ==
// BEGIN compare_two_strings
let string1 : String = "Hello"
let string2 : String = "Hel" + "lo"

if string1 == string2 {
    println("The strings are equal")
}
// END compare_two_strings

// Compare to see if two strings are the same object with ===
// BEGIN compare_strings_same_object
if string1 as AnyObject === string2 as AnyObject {
    println("The strings are the same object")
}
// END compare_strings_same_object

// Check to see if a string has a certain suffix or prefix
// BEGIN string_prefix_and_suffix
if string1.hasPrefix("H") {
    println("String begins with an H")
}
if string1.hasSuffix("llo") {
    println("String ends in 'llo'")
}
// END string_prefix_and_suffix

var i : Int? = 2

2 + i!


// Converting a string to uppercase and lowercase
// BEGIN string_case_changing
string1.uppercaseString // = "HELLO"
string2.lowercaseString // = "hello"
// END string_case_changing
// ------
// Searching Strings

// NOTE: NOT SURE ABOUT THIS. SEEMS WEIRD.


// ------
// NSValue and NSNumber

// NSValues and NSNumbers contain values and numbers
var anNSNumber : NSNumber = 2
var aNumber = 3
aNumber + anNSNumber.integerValue


// ------
// Data

// BEGIN string_to_data
let stringToConvert = "Hello, Swift"
let data = "foo".dataUsingEncoding(NSUTF8StringEncoding)
// END string_to_data

// ------
// Loading Data from Files and URLs

// BEGIN loading_data_from_files
// Loading from URL
if let fileURL = NSBundle.mainBundle()
    .URLForResource("A File", withExtension: "txt") {
    let loadedDataFromURL = NSData(contentsOfURL:fileURL)
}

// Loading from a file
if let filePath = NSBundle.mainBundle()
    .pathForResource("Something", ofType: "jpg") {
    let loadedDataFromPath = NSData(contentsOfFile:filePath)
}
// END loading_data_from_files

// ------
// Serialization and Deserialization

// BEGIN serializable_object
class SerializableObject : NSObject, NSCoding {
    
    var name : String?
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name!, forKey:"name")
    }
    override init() {
        self.name = "My Object"
    }
    required init(coder aDecoder: NSCoder)  {
        self.name = aDecoder.decodeObjectForKey("name") as? String
    }
}
// END serializable_object

// BEGIN serializing_an_object
let anObject = SerializableObject()

anObject.name = "My Thing That I'm Saving"

// converting it to data
let objectConvertedToData =
    NSKeyedArchiver.archivedDataWithRootObject(anObject)

// loading it from data - SHOULD work, throws an exception :(
let loadedObject =
    NSKeyedUnarchiver.unarchiveObjectWithData(objectConvertedToData) as? SerializableObject
loadedObject?.name
// END serializing_an_object

// ------
// Delegation

// BEGIN delegate_example
// Define a protocol that has a function called doSomething
protocol MyClassDelegate {
    func doSomething()
}

class MyClass {
    // The delegate can be any object that conforms to the MyClassDelegate
    // protocol
    var delegate : MyClassDelegate?
    
    func somethingHappened() {
        // Check to see if the delegate is there, then call it
        delegate?.doSomething()
    }
}
// END delegate_example

class SomeOtherThing : MyClassDelegate {
    func doSomething() {
        println("I'm being useful!")
    }
}


let myClassObject = MyClass()
myClassObject.somethingHappened() // does nothing

let someOtherObject = SomeOtherThing()
myClassObject.delegate = someOtherObject
myClassObject.somethingHappened() // prints "I'm being useful!"

// ------
// Key-Value Observing

class Boat : NSObject {
    var colour = 1
}
/*
class ObservingClass : NSObject {
    func observeObject(theObject : NSObject) {
        theObject.addObserver(self, forKeyPath: "colour", options: NSKeyValueObservingOptions.New | NSKeyValueObservingOptions.Old, context: nil)
    }

    override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafePointer<()>) {
        
        var theChange = change as [String : String]
        
        var oldColour = theChange[NSKeyValueChangeOldKey] as String
        var newColour = theChange[NSKeyValueChangeNewKey] as String
        
        println("Colour changed from \(oldColour) to \(newColour)")
        
    }
}

var aNewBoat = Boat()
aNewBoat.colour = 2

var observerObject = ObservingClass()
observerObject.observeObject(aNewBoat) // NOTE: this appears to be throwing some kind of exception, will revisit later

*/
