//
//  MultipleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    private var question: Question { quizManager.questionList[quizManager.currentQuestion] }
    
    @State var isOnA = false
    @State var isOnB = false
    @State var isOnC = false
    @State var isOnD = false
    @State var isOnE = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("\(question.text)")
                    .font(.custom("Optima", size: 22))
                //
                Toggle(question.answers[0].text, isOn: $isOnA)
                Toggle(question.answers[1].text, isOn: $isOnB)
                Toggle(question.answers[2].text, isOn: $isOnC)
                Toggle(question.answers[3].text, isOn: $isOnD)
                Toggle(question.answers[4].text, isOn: $isOnE)
            }
            .padding([.leading, .trailing], 20)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    QuestionFlowView()
                        .onAppear {
                            let choices = [isOnA, isOnB, isOnC, isOnD, isOnE].enumerated()
                            for (index, choice) in choices {
                                if choice == true {
                                    quizManager.selectedAnswer(question.answers[index])
                                }
                            }
                            if quizManager.currentQuestion < (quizManager.questionList.count - 1) {
                                quizManager.currentQuestion += 1
                            }
                            print(quizManager.currentQuestion)
                            print(quizManager.selectedAnswers)
                        }
                } label: {
                    Text("Next")
                        .padding()
                        .glassEffect(.clear.tint(.lightRed.opacity(0.3)))
                }
            }
            .sharedBackgroundVisibility(.hidden)
//            ToolbarItem(placement: .topBarLeading) {
//                NavigationLink {
//                    QuestionFlowView()
//                        .onAppear {
//                            let lastIndex = (quizManager.selectedAnswers.count - 1)
//                            let choices = [isOnA, isOnB, isOnC, isOnD, isOnE]
//                            var trueChoices: [Bool] = []
//                            for choice in choices {
//                                if choice == true {
//                                    trueChoices.append(choice)
//                                }
//                            }
//                            for (index, _) in trueChoices.enumerated() {
//                                quizManager.selectedAnswers.remove(at: (lastIndex - index))
//                            }
//                            quizManager.currentQuestion -= 1
//                            print(quizManager.currentQuestion)
//                            print(quizManager.selectedAnswers)
//                        }
//                } label: {
//                    Text("Back")
//                        .padding()
//                        .glassEffect(.clear.tint(.lightRed.opacity(0.3)))
//                }
//            }
//            .sharedBackgroundVisibility(.hidden)
        }
        .navigationBarBackButtonHidden()
    }
}


