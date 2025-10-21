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
    private var answers: [Answer] = []
        
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("\(vm.question.text)")
                    .font(.custom("Optima", size: 22))
                //
                Toggle(vm.question.answers[0].text, isOn: $vm.isOnA)
                    .onChange(of: vm.isOnA) {
                        quizManager.updateSelectedAnswer(question: vm.question, answers: answers)
                    }
                Toggle(vm.question.answers[1].text, isOn: $vm.isOnB)
                Toggle(vm.question.answers[2].text, isOn: $vm.isOnC)
                Toggle(vm.question.answers[3].text, isOn: $vm.isOnD)
                Toggle(vm.question.answers[4].text, isOn: $vm.isOnE)
            }
            .padding([.leading, .trailing], 20)
        }
    }
}

