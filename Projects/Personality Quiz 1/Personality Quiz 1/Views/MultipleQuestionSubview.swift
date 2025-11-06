//
//  MultipleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    
    @Environment(QuizManager.self) var quizManager
        
    var body: some View {
        @Bindable var quizManager = quizManager
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("\(quizManager.currentQuestion.text)")
                    .font(.custom("Optima", size: 22))
                //
                Toggle(quizManager.currentQuestion.answers[0].text, isOn: $quizManager.isOnA)
                    .onChange(of: quizManager.isOnA) {
                        print(quizManager.getBoolList())
                        quizManager.updateMultipleAnswers(quizManager.getBoolList(), currentQuestion: quizManager.currentQuestion)
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                    }
                Toggle(quizManager.currentQuestion.answers[1].text, isOn: $quizManager.isOnB)
                    .onChange(of: quizManager.isOnB) {
                        print(quizManager.getBoolList())
                        quizManager.updateMultipleAnswers(quizManager.getBoolList(), currentQuestion: quizManager.currentQuestion)
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                    }
                Toggle(quizManager.currentQuestion.answers[2].text, isOn: $quizManager.isOnC)
                    .onChange(of: quizManager.isOnC) {
                        print(quizManager.getBoolList())
                        quizManager.updateMultipleAnswers(quizManager.getBoolList(), currentQuestion: quizManager.currentQuestion)
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                    }
                Toggle(quizManager.currentQuestion.answers[3].text, isOn: $quizManager.isOnD)
                    .onChange(of: quizManager.isOnD) {
                        print(quizManager.getBoolList())
                        quizManager.updateMultipleAnswers(quizManager.getBoolList(), currentQuestion: quizManager.currentQuestion)
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                    }
                Toggle(quizManager.currentQuestion.answers[4].text, isOn: $quizManager.isOnE)
                    .onChange(of: quizManager.isOnE) {
                        print(quizManager.getBoolList())
                        quizManager.updateMultipleAnswers(quizManager.getBoolList(), currentQuestion: quizManager.currentQuestion)
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentAnswers)
                    }
            }
            .padding([.leading, .trailing], 20)
        }
    }
}

