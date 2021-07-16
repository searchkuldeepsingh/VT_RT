import UIKit
import Foundation


// Reference - https://www.codementor.io/blog/value-vs-reference-6fm8x0syje#:~:text=In%20Swift%20there%20are%20two,type%20is%20usually%20a%20class%20.



// Value Type
//Struct
//Let’s experiment with structs and prove that they’re value types:

// 1
struct Car {
    var brand: String
    var model: String
}

// 2
var golf = Car(brand: "Volkswagen", model: "Golf")
// 3
let polo = golf

// 4
golf.brand = "Skoda"
golf.model = "kushaq"

// 5
print(golf)
print(polo)



// Enum

// 1
enum Language {
    case italian
    case english
}

// 2
var italian = Language.italian
// 3
let english = italian

// 4
italian = .english

// 5
print(italian)
print(english)

/*
The last value type that we'll explore is tuple. A tuple type is a comma-separated list of zero or more types, enclosed in parentheses. You can access its values using the dot (.) notation followed by the index of the value.
 
 You can also name the elements in a tuple and use the names to access the different values.
*/

// 1
var ironMan = ("Tony", "Stark")
// 2
let parent = ironMan

// 3
ironMan.0 = "Alfred"

// 4
print(ironMan)
print(parent)

/*
 When to Use Value Types
 Use value types when comparing instance data with == makes sense.
 == checks if every property of the two instances is the same.
 With value types you always get a unique, copied instance, and you can be sure that no other part of your app is changing the data under the hood. This is especially helpful in multi-threaded environments where a different thread could alter your data.

 Use a value type when you want copies to have an independent state, and the data will be used in code across multiple threads.

 In Swift, Array, String, and Dictionary are all value types.
 */


/*
 Reference Types
 In Swift, reference type instances share a single copy of their data, so that every new instance will point to the same address in memory. A typical example is a class, function, or closure.
 */


func address<T: AnyObject>(of object: T) -> Int {
    return unsafeBitCast(object, to: Int.self)
}

// This function prints the address of an object, which will help you check whether you're referencing the same instance or not.

//Class
//The first reference type that you'll look at is a class.


// 1
class Dog: CustomStringConvertible {
    var age: Int
    var weight: Int

    // 2
    var description: String {
        return "Age \(age) - Weight \(weight)"
    }

    // 3
    init(age: Int, weight: Int) {
        self.age = age
        self.weight = weight
    }
}

// 4
let doberman = Dog(age: 1, weight: 70)
// 5
let chihuahua = doberman

// 6
doberman.age = 2
// 7
chihuahua.weight = 10

// 8
print(doberman)
print(chihuahua)

// 9
print(address(of: doberman))
print(address(of: chihuahua))

/*
Functions and Closures
A closure is used to refer to a function along with the variables from its scope that it encapsulates. Functions are essentially closures that store references to variables in their context.
*/

let closure = { print("Kuldeep") }
func function() -> (){ print("Test") }

let closureFuntion = closure


closure()
function()
print(closureFuntion())


/*
 When to Use Reference Types
 Use a reference type when comparing instance identity with === makes sense. === checks if two objects share the same memory address.

 They’re also useful when you want to create a shared, mutable state.

 As a general rule, start by creating your instance as an enum, then move to a struct if you need more customization, and finally move to class when needed.
 */
