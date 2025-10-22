//
//  QuestionView.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct QuestionFlowView: View {
    @Environment(QuizManager.self) var quizManager
    
    var body: some View {
        VStack {
            switch self.quizManager.currentQuestion.type {
            case .single:
                SingleQuestionSubview()
            case .multiple:
                MultipleQuestionSubview()
            case .ranged:
                RangedQuestionSubview()
            }
        }
        .toolbar {
            // NEXT BUTTON
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    QuestionFlowView()
                        .onAppear {
                            quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.questionList[quizManager.currentQuestionIndex].answers[0])
                            if quizManager.currentQuestionIndex < (quizManager.questionList.count - 1) {
                                quizManager.currentQuestionIndex += 1
                            }
                            print("current question: \(quizManager.currentQuestionIndex)")
                            print("selected answers: \(quizManager.selectedAnswers)")
                        }
                } label: {
                    Text("Next")
                        .padding()
                        .glassEffect(.clear.tint(.lightRed.opacity(0.3)))
                }
            }
            .sharedBackgroundVisibility(.hidden)
            //
        }
    }
}


