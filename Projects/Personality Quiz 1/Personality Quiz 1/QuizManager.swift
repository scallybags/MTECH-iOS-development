//
//  QuizData.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/15/25.
//
import SwiftUI

struct Question: Hashable {
    var id = UUID()
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

struct QuestionList {
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
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer: Hashable {
    var text: String
    var type: DuneCharacter
}

enum DuneCharacter {
    case paul, chani, ladyJess, raban, stilgar
}

@Observable class QuizManager {
    let questionList = QuestionList().questionList
    //
    var currentQuestionIndex = 0
    //
    var selectedAnswers: [UUID: [Answer]] = [:]
    //
    var currentQuestion: Question = QuestionList().questionList[0]
    //
    func updateSelectedAnswer(question: Question, answers: Answer) {
        selectedAnswers[question.id] = [answers]
    }
}
