import UIKit

// MARK - For Loops

for index in 1...5 {
    print("This number is \(index)")
}

for _ in 1...3 {
    print("Hello World")
}

let names = ["Alice", "Bob", "Charlie", "Diana", "Eve"]

for name in names {
    if name.contains("i") {
        continue // skips to the next iteration of the for loop
    }
    print("\(name): You havae $100")
    break // stops the loop when it reaches the break keyword.
}

for letter in "ABCDEFGHIJK" {
    print(letter)
}

let vehicles = ["unicycle" : 1, "bicycle" : 2, "tricycle" : 3, "quad bike" : 4]
for (vehicle, wheels) in vehicles {
    print("A \(vehicle) has \(wheels) wheels.")
}

// Mark - While Loops

var numberOfLives = 3

while numberOfLives > 0 {
    updateLivesCount()
    print(numberOfLives)
}

// Mark - Control Transfer Statements

for counter in -10...10 {
    print(counter)
    if counter == 0 {
        break
    }
}




// Helper Methods

func playMove() {
    print("Playing a move!")
}

@MainActor
func updateLivesCount() {
    numberOfLives -= 1
}
