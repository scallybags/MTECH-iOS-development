//
//  SingleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct SingleQuestionSubview: View {
    @State private var pickerChoice = "A"
    var pickerABCD = ["A.", "B.", "C.", "D."]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("Question Here?")
                    .font(.custom("Optima", size: 22))
                //
                Picker("picker", selection: $pickerChoice) {
                    ForEach(pickerABCD, id: \.self) { letter in
                        Text(letter)
                    }
                }
                .pickerStyle(.wheel)
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

#Preview {
    NavigationStack {
        SingleQuestionSubview()
    }
}
