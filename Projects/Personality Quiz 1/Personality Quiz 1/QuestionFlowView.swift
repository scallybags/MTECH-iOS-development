//
//  QuestionView.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct QuestionFlowView: View {
    var quizManager = QuizManager()
    var body: some View {
        switch quizManager.questionList[quizManager.currentQuestion].type {
        case .single:
            SingleQuestionSubview()
        case .multiple:
            MultipleQuestionSubview()
        case .ranged:
            RangedQuestionSubview()
        }
    }
}

#Preview {
    QuestionFlowView()
}
