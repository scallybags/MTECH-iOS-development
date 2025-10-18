//
//  RangedQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct RangedQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    @State private var sliderValue: Double = 5
    @State private var isEditing = false
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
                Slider(
                        value: $sliderValue,
                        in: 0...5,
                        step: 1
                    ) {
                        Text("Speed")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("5")
                    } onEditingChanged: { editing in
                        isEditing = editing
                    }
                    .tint(.lightRed)
                    .padding()
                //
                Text("\(Int(sliderValue))/5")
                    .font(.custom("Optima", size: 25))
                    .foregroundColor(isEditing ? .red : .black)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    Text("Nexted")
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


