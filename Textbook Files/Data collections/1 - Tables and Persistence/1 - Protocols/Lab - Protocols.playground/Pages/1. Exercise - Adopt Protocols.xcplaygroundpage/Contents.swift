/*:
## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
import Foundation

class Martian : Codable {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let martian1 = Martian(name: "Kobe", age: 268)
let martian2 = Martian(name: "Kody", age: 546)
//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
extension Martian: CustomStringConvertible {
    var description: String {
        "Martian- Name: \(self.name) | Age: \(self.age)"
    }
}

print(martian1)
print(martian2)
//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
extension Martian: Equatable {
    static func == (lhs: Martian, rhs: Martian) -> Bool {
        lhs.name == rhs.name && lhs.age == rhs.age
    }
}

//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
extension Martian: Comparable {
    static func < (lhs: Martian, rhs: Martian) -> Bool {
        lhs.age < rhs.age
    }
}

let m1 = Martian(name: "Chad", age: 45)
let m2 = Martian(name: "Brooke", age: 43)

print( m1 < m2 )
//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(martian1) {
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
}

/*:
page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
