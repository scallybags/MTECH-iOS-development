//
//  SingleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    private var question: Question { quizManager.questionList[quizManager.currentQuestion] }
    @State var pickerChoice: Answer = Answer(text: "", type: .paul)
    
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
                Picker("Picker", selection: $pickerChoice) {
                    ForEach(question.answers, id: \.self) { answer in
                        Text(answer.text)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    QuestionFlowView()
                        .onAppear {
                            quizManager.selectedAnswer(pickerChoice)
                            quizManager.currentQuestion += 1
                            print(quizManager.currentQuestion)
                            print(quizManager.selectedAnswers)
                        }
                        .onDisappear {
                            quizManager.selectedAnswers
                            quizManager.currentQuestion -= 1
                            print(quizManager.currentQuestion)
                        }
                } label: {
                    Text("Next")
                        .padding()
                        .glassEffect(.clear.tint(.lightRed.opacity(0.3)))
                }
            }
            .sharedBackgroundVisibility(.hidden)
        }
    }
}


