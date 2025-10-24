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
                
                Text("You are:\()")
                    .font(.custom("Optima", size: 22)).underline()
                //
                Text("<DuneCharacter>")
            }
            //
        }
    }
}

