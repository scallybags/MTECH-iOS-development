import UIKit

struct enemy {
    var name : String = ""
    var health : Int = 0
    var strength : Int = 0
    var defence : Int = 0
    
    mutating func takeDamage() {
        health -= 1
    }
}

