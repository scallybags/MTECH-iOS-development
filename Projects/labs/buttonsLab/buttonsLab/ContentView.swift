//
//  ContentView.swift
//  buttonsLab
//
//  Created by Andrew Vanderwilt on 9/29/25.
//

import SwiftUI

struct customButtonMod1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Baskerville", size: 25))
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Capsule().foregroundColor(configuration.isPressed ? .brown : .black)
            )
            .foregroundColor(configuration.isPressed ? .white : .green)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .padding()
            
    }
}

struct customButtonMod2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.minimum(50, 60))
            .border(.black)
            .background(
                Rectangle().foregroundColor(configuration.isPressed ? .brown : .black)
            )
    }
}



struct ContentView: View {
    
    @State var handsDisabled = true
    
    var body: some View {
        VStack{
            Button("⛄︎") {}
                .font(.system(size: 50))
            
            Button(action: myPrint) {
                Text("Button")
            }
            .buttonStyle(customButtonMod1())
            
            Button(action: myPrint) {
                Label("Sign in", systemImage: "person.fill.checkmark")
            }
            .padding()
            .labelStyle(.iconOnly)
            
            Button("Enable Hands") {
                handsDisabled.toggle() ; print(handsDisabled)
            }
                .buttonStyle(customButtonMod2())
            
            Button("🫸Hands🫷") { print("hands") }
                .foregroundColor(.white)
                .padding()
                .background(handsDisabled ? .green : .gray )
                .disabled(handsDisabled)
        }
    }
    
    func myPrint() {
        print("Hello Swift")
    }
}

#Preview {
    ContentView()
}
