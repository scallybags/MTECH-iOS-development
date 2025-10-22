//
//  MultipleQuestionViewModel.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/21/25.
//
import SwiftUI

@Observable
class MultipleQuestionViewModel {
    var quizManager: QuizManager
    
    var isOnA = false
    var isOnB = false
    var isOnC = false
    var isOnD = false
    var isOnE = false
    
    init(quizManager: QuizManager = QuizManager(), isOnA: Bool = false, isOnB: Bool = false, isOnC: Bool = false, isOnD: Bool = false, isOnE: Bool = false) {
        self.quizManager = quizManager
        self.isOnA = isOnA
        self.isOnB = isOnB
        self.isOnC = isOnC
        self.isOnD = isOnD
        self.isOnE = isOnE
    }
}
