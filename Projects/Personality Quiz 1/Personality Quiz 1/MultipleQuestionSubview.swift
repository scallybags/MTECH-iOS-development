//
//  MultipleQuestionSubview.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct MultipleQuestionSubview: View {
    @State var isOnA = false
    @State var isOnB = false
    @State var isOnC = false
    @State var isOnD = false
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
                Toggle("A.", isOn: $isOnA)
                Toggle("B.", isOn: $isOnB)
                Toggle("C.", isOn: $isOnC)
                Toggle("D.", isOn: $isOnD)
            }
            .padding([.leading, .trailing], 20)
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
        MultipleQuestionSubview()
    }
}
