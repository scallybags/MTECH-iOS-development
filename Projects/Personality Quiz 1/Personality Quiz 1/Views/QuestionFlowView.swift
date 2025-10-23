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
                    .onAppear {
                        print("sqsv")
                        quizManager.currentAnswers = [quizManager.currentQuestion.answers[0]]
                    }
            case .multiple:
                MultipleQuestionSubview()
                    .onAppear {
                        print("mqsv")
                        quizManager.currentAnswers = []
                    }
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
                            print("qfv")
                            quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                            if quizManager.currentQuestionIndex < (quizManager.questionList.count - 1) {
                                quizManager.currentQuestionIndex += 1
                                quizManager.currentQuestion = quizManager.questionList[quizManager.currentQuestionIndex]
                            }
                            print("current question: \(quizManager.currentQuestionIndex)")
                            for (question, answers) in quizManager.selectedAnswers {
                                print("\(question): \(answers)")
                            }
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


