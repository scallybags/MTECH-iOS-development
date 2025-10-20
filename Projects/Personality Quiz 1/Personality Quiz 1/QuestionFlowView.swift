//
//  QuestionView.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct QuestionFlowView: View {
    @Environment(QuizManager.self) var quizManager
    
    let question: Question
    
    var body: some View {
        VStack {
            switch self.question.type {
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
                    QuestionFlowView(question: quizManager.questionList[quizManager.currentQuestionIndex])
                        .onAppear {
//                            quizManager.selectedAnswer(question: question, answers: answers)
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
        }.navigationBarBackButtonHidden()
    }
}


