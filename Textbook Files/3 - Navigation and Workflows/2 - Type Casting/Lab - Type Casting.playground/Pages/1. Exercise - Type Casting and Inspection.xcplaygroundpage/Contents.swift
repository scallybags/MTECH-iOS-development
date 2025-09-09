/*:
## Exercise - Type Casting and Inspection

 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let collection: [Any] = [3, 5.5, 68, "String", "cabbages", true]

//:  Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
for value in collection {
    if let int = value as? Int {
        print("The Integer has a value of \(int)")
    } else if let value = value as? String {
        print("The String has a value of \(value)")
    } else if let value = value as? Double {
        print("The Double has a value of \(value)")
    } else if let value = value as? Bool {
        print("The Boolean has a value of \(value)")
    } else {
        print("The Collection has no values")
    }
}

//:  Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
var dictonary: [String : Any] = [
    "one":1,
    "two":2,
    "twoDouble":2.0,
    "string":"Hello World!",
    "bool":true,
    "strintInt":"12",
    "stringDouble": "2.5"
]
print(dictonary)
//:  Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
var total: Double = 0
for item in dictonary {
    if let itemValue = item.value as? Int {
        total += Double(itemValue)
    } else if let itemValue = item.value as? Double {
        total += itemValue
    } else if let itemValue = item.value as? String {
        total += 1
    } else if let itemValue = item.value as? Bool {
        if itemValue == true {
            total += 2
        } else {
            total -= 3
        }
    }
}
print(total)
//:  Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.


var total2: Double = 0
for (key , value) in dictonary {
    if let itemValue = value as? Int {
        total += Double(itemValue)
    } else if let itemValue = value as? Double {
        total += itemValue
    } else if let itemValue = value as? String {
        if let itemStringAsDouble = Double(itemValue) {
            total2 += itemStringAsDouble
        }
    }
}
print(total2)
/*:
page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
 */
