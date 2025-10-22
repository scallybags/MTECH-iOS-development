//
//  MultipleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    @State private var vm = MultipleQuestionViewModel()
        
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
                Toggle(quizManager.currentQuestion.answers[0].text, isOn: $vm.isOnA)
                    .onChange(of: vm.isOnA) {
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentQuestion.answers[0])
                    }
                Toggle(quizManager.currentQuestion.answers[1].text, isOn: $vm.isOnB)
                    .onChange(of: vm.isOnB) {
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentQuestion.answers[1])
                    }
                Toggle(quizManager.currentQuestion.answers[2].text, isOn: $vm.isOnC)
                    .onChange(of: vm.isOnC) {
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentQuestion.answers[2])
                    }
                Toggle(quizManager.currentQuestion.answers[3].text, isOn: $vm.isOnD)
                    .onChange(of: vm.isOnD) {
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentQuestion.answers[3])
                    }
                Toggle(quizManager.currentQuestion.answers[4].text, isOn: $vm.isOnE)
                    .onChange(of: vm.isOnE) {
                        quizManager.updateSelectedAnswer(question: quizManager.currentQuestion, answers: quizManager.currentQuestion.answers[4])
                    }
            }
            .padding([.leading, .trailing], 20)
        }
    }
}

