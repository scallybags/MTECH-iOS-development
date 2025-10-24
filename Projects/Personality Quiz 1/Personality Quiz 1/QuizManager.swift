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
        ),
        Question(
            text: "results",
            type: .result,
            answers: [
                Answer(text: "Paul", type: .paul),
                Answer(text: "Chani", type: .chani),
                Answer(text: "Lady Jessica", type: .ladyJess),
                Answer(text: "Raban", type: .raban),
                Answer(text: "Stilgar", type: .stilgar),
            ]
        )
    ]
}

enum ResponseType {
    case single, multiple, ranged, result
}

struct Answer: Hashable {
    var text: String
    var type: DuneCharacter
}

enum DuneCharacter {
    case paul, chani, ladyJess, raban, stilgar
}

@Observable
class QuizManager {
    var selectedCharacter: DuneCharacter = .paul
    //
    let questionList = QuestionList().questionList
    //
    var isOnA = false
    var isOnB = false
    var isOnC = false
    var isOnD = false
    var isOnE = false
    //
    var currentQuestionIndex = 0
    //
    var selectedAnswers: [UUID: [Answer]] = [:]
    //
    var currentQuestion: Question = QuestionList().questionList[0]
    //
    var currentAnswers: [Answer] = []
    //
    func updateSelectedAnswer(question: Question, answers: [Answer]) {
        selectedAnswers[question.id] = answers
    }
    //
    func updateMultipleAnswers(_ boolList: [Bool], currentQuestion: Question) {
        self.currentAnswers = []
        for (index, bool) in boolList.enumerated() {
            if bool == true {
                currentAnswers.append(currentQuestion.answers[index])
            }
        }
    }
    //
    func getBoolList() -> [Bool] {
        [
            self.isOnA,
            self.isOnB,
            self.isOnC,
            self.isOnD,
            self.isOnE,
        ]
    }
    //
    func getSelectedCharacter(_ dictionary: [UUID: [Answer]]) -> DuneCharacter? {
        var resultCharacter: DuneCharacter
        var allAnswers: [Answer] = []
        var charactersCount: [DuneCharacter:Int] = [:]
        
        for answerList in dictionary {
            for answer in answerList.value {
                allAnswers.append(answer)
            }
        }
        for answer in allAnswers {
            charactersCount[answer.type, default: 0] += 1
        }
        
        guard let highest = charactersCount.max(by: {$0.value < $1.value})?.key else { return nil }
        resultCharacter = highest
        return resultCharacter
    }
}
