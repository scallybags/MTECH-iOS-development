//
//  SingleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    private var question: Question { quizManager.questionList[quizManager.currentQuestionIndex] }
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
    }
}


