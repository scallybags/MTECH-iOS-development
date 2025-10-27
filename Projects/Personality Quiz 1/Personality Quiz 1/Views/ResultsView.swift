//
//  ResultsView.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct ResultsView: View {
    @Environment(QuizManager.self) var quizManager
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("You are:")
                    .font(.custom("Optima", size: 22))
                //
                switch quizManager.selectedCharacter {
                case .paul:
                    VStack {
                        Text("Paul")
                            .font(.custom("Optima", size: 32)).bold()
                        Image(.paul2)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                    }
                case .chani:
                    VStack {
                        Text("Chani")
                            .font(.custom("Optima", size: 32)).bold()
                        Image(.chani2)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                    }
                case .ladyJess:
                    VStack {
                        Text("Lady Jessica")
                            .font(.custom("Optima", size: 32)).bold()
                        Image(.ladyJess2)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                    }
                case .raban:
                    VStack {
                        Text("Raban")
                            .font(.custom("Optima", size: 32)).bold()
                        Image(.raban2)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                    }
                case .stilgar:
                    VStack {
                        Text("Stilgar")
                            .font(.custom("Optima", size: 32)).bold()
                        Image(.stilgar2)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 20)
                    }
                }
                //
            }
            //
        }
    }
}

