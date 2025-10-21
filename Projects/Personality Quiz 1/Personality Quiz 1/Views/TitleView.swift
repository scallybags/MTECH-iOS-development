//
//  TitleView.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct TitleView: View {
    var quizManager = QuizManager()
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                    .ignoresSafeArea()
                //
                VStack {
                    Image(.dune2)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 20)
                    //
                    Text("Which DUNE character are you?")
                        .font(.custom("Optima", size: 22))
                    //
                    NavigationLink {
                        QuestionFlowView(question: quizManager.questionList[quizManager.currentQuestionIndex])
                    } label: {
                        Text("Begin")
                            .font(.custom("Optima", size: 40))
                            .padding()
                            .foregroundColor(.white)
                            .background(.lightRed)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
            }
        }.environment(quizManager)
    }
}

#Preview {
    TitleView()
}
