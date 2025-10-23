//
//  SingleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
//    private var question: Question { quizManager.questionList[quizManager.currentQuestionIndex] }
    @State var pickerChoice: Answer = Answer(text: "", type: .paul)
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("\(quizManager.currentQuestion.text)")
                    .font(.custom("Optima", size: 22))
                //
                Picker("Picker", selection: $pickerChoice) {
                    ForEach(quizManager.currentQuestion.answers, id: \.self) { answer in
                        Text(answer.text)
                    }
                }
                .pickerStyle(.wheel)
                .onChange(of: pickerChoice) {
                    print("picker choice changed to \(pickerChoice)")
                    quizManager.currentAnswers = [pickerChoice]
                    quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                }
            }
        }
    }
}


