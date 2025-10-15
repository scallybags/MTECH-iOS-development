//
//  QuizData.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/15/25.
//
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: DuneCharacter
}

enum DuneCharacter {
    case paul, chani, ladyJess, raban, stilgar
}

struct QuizManager {
    var currentQuestion = 0
    //
    var selectedAnswers: [String:Int] = [
        "Paul": 0,
        "Chani": 0,
        "Lady Jessica": 0,
        "Raban": 0,
        "Stilgar": 0,
    ]
    //
    let questionList: [Question] = [
        Question(
            text: "What is your favorite type of weather?",
            type: .single,
            answers: [
                Answer(text: "Rainy", type: .paul),
                Answer(text: "Sunny", type: .chani),
                Answer(text: "Cloudy", type: .ladyJess),
                Answer(text: "Forest Fire", type: .raban),
                Answer(text: "Sandstorm", type: .stilgar),
            ]
        ),
        Question(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Fencing", type: .paul),
                Answer(text: "Dancing", type: .chani),
                Answer(text: "Drinking Poision", type: .ladyJess),
                Answer(text: "Yelling", type: .raban),
                Answer(text: "Spitting", type: .stilgar),
            ]
        ),
        Question(
            text: "Out of 5 how much do you like fire?",
            type: .ranged,
            answers: [
                Answer(text: "1", type: .stilgar),
                Answer(text: "2", type: .chani),
                Answer(text: "3", type: .ladyJess),
                Answer(text: "4", type: .paul),
                Answer(text: "5", type: .raban),
            ]
        )
    ]
    //
    func selectedAnswer(_ answer: Answer) {
        switch answer.type {
        case .paul:
            selectedAnswers[.paul] += 1
        case .chani:
            <#code#>
        case .ladyJess:
            <#code#>
        case .raban:
            <#code#>
        case .stilgar:
            <#code#>
        }
    }
    //
}
