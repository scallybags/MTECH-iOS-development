//
//  MultipleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    private var question: Question { quizManager.questionList[quizManager.currentQuestionIndex] }
    
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
    }
}

