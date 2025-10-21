//
//  ResultsView.swift
//  Personality Quiz 1
//
//  Created by Andrew Vanderwilt on 10/13/25.
//

import SwiftUI

struct ResultsView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Gradient(colors: [.skyBlue , .tan]))
                .ignoresSafeArea()
            //
            VStack {
                Text("Results")
                    .font(.custom("Optima", size: 22)).underline()
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
    ResultsView()
}
