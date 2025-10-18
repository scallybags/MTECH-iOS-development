//
//  SingleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    @State private var pickerChoice: DuneCharacter = .paul
    private var question: Question { quizManager.questionList[quizManager.currentQuestion] }
    
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
                    let answers = question.answers
                    ForEach(answers.indices, id: \.self) { index in
                        Text(answers[index].text)
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
                            quizManager.currentQuestion += 1
                            print(quizManager.currentQuestion)
                        }
                        .onDisappear {
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


