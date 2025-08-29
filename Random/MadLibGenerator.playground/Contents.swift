import UIKit

func generateMadLib(noun1: String, noun2: String, noun3: String, pluralNoun: String, verb1: String, verb2: String, verb3: String, adjective1: String, adjective2: String, adjective3: String) -> String {
    
    let strings = [noun1, noun2, noun3, pluralNoun, adjective1, adjective2, adjective3, verb1, verb2, verb3]
    
    for string in strings {
        if string.isEmpty {
            return "Input invalid"
        }
    }
    
    
    
    let nounArray = [noun1, noun2, noun3].shuffled()
    for noun in nounArray {
        if noun.isEmpty {
            return "Input invalid"
        }
    }
    
    let adjectiveArray = [adjective1, adjective2, adjective3].shuffled()
    for adjective in adjectiveArray {
        if adjective.isEmpty {
            return "Input invalid"
        }
    }
        
    let verbArray = [verb1, verb2, verb3].shuffled()
    for verb in verbArray {
        if verb.isEmpty {
            return "Input invalid"
        }
    }
    
    let randomStorySelection: Int = Int.random(in: 1...3)
    
    return switch randomStorySelection {
    case 1:
        "One day, I found a(n) \(adjectiveArray[0]) map inside an old \(nounArray[0]). It led to a\(adjectiveArray[1]) island where \(pluralNoun) danced around a golden \(nounArray[1]). I decided to \(verbArray[0]) toward it, but the ground began to \(verbArray[1]), and suddenly, a(n) \(adjectiveArray[2]) \(nounArray[2]) began to \(verbArray[2])!"
    case 2:
        "It all started when I spilled \(nounArray[0]) on my \(nounArray[1]). My \(adjectiveArray[0]) shirt was ruined! Then I saw my \(pluralNoun) flying away in the wind. I tried to \(verbArray[0]) after them, but I slipped on a(n) \(adjectiveArray[1]) puddle and had to \(verbArray[1]). Finally, I gave up and just sat on a \(adjectiveArray[2]) \(nounArray[2]) to \(verbArray[2]) in peace."
    default:
        "Yesterday, I went to the zoo and saw a(n) \(adjectiveArray[0]) \(nounArray[0]) trying to \(verbArray[0]) with a(n) \(adjectiveArray[1]) \(nounArray[1]). The \(pluralNoun) in the next cage started to \(verbArray[1]) really loudly! I was so amazed, I dropped my \(nounArray[2]) and nearly fell into a(n) \(adjectiveArray[2]) pit of mud while trying to \(verbArray[2]) away."
    }
}
print(generateMadLib(noun1: "Bob", noun2: "french toast", noun3: "pencil", pluralNoun: "dogs", verb1: "jumping", verb2: "sleeping", verb3: "eating", adjective1: "tired", adjective2: "fat", adjective3: "crazy"))

