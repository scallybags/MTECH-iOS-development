//
//  ContentView.swift
//  buttonsTest
//
//  Created by Andrew Vanderwilt on 9/29/25.
//

import SwiftUI

struct GradientbuttonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .font(.custom("Futura", size: 18))
            .foregroundColor(.white)
            .background(
                Capsule()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
            
    }
}

struct ContentView: View {
    var body: some View {
        
        VStack {
            Button(action: next) {
                Text("Submit")
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .foregroundStyle(Color.white)
            .background(
                Capsule()
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
