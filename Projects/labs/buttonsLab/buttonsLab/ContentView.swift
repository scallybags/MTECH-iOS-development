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
            .padding(.horizontal)
    }
}

struct customButtonMod2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.minimum(30, 40))
            .border(.black)
            .background(
                Rectangle().foregroundColor(configuration.isPressed ? .brown : .black)
            )
    }
}

struct customButtonMod3: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Impact", size: 30))
            .foregroundColor(.white)
            .padding(CGFloat(30))
            .background(
                Capsule().foregroundColor(.cyan)
            )
            .scaleEffect(configuration.isPressed ? 2 : 1 )
    }
}



struct ContentView: View {
    
    @State var handsDisabled = true
    
    var body: some View {
        VStack{
            Button("⛄︎") { print("Snowman") }
                .font(.system(size: 50))
                .foregroundColor(.white)
                .frame(width: 50)
                .background(
                    RoundedRectangle(
                        cornerSize: CGSize(width: 10, height: 10),
                    ).foregroundColor(.pink)
                )
            
            Button(action: myPrint) {
                Text("Button")
            }
                .buttonStyle(customButtonMod1())
            
            Button(action: myPrint) {
                Label("Sign in", systemImage: "person.fill.checkmark").imageScale(.large)
                
            }
                .labelStyle(.iconOnly)
                .frame(width: 50, height: 50)
                .background(
                    RoundedRectangle(
                        cornerSize: CGSize(width: 10, height: 10),
                    ).foregroundColor(.brown)
                )
            
            Button("Enable Hands") {
                handsDisabled.toggle() ; print(handsDisabled)
            }
                .buttonStyle(customButtonMod2())
            
            Button(action: printHands) { Text("🫸Hands🫷") }
                .foregroundColor(.white)
                .padding()
                .background( handsDisabled ? .gray : .green )
                .disabled( handsDisabled )
            Button("Power Up") {}
                .buttonStyle(customButtonMod3())
        }
        HStack {
            Button(action: { print("square.and.arrow.up") }) {
                Label("", systemImage: "square.and.arrow.up").imageScale(.large)
                
            }
            .foregroundColor(.white)
            .labelStyle(.iconOnly)
            .frame(width: 60, height: 50)
            .background(
                RoundedRectangle(
                    cornerSize: CGSize(width: 10, height: 10),
                ).foregroundColor(
                    Color(hue: 0.7, saturation: 1, brightness: 1, opacity: 1)
                    )
                )
            
            Button(action: { print("square.and.arrow.down") }) {
                Label("", systemImage: "square.and.arrow.down").imageScale(.large)
            }
            .foregroundColor(.white)
            .labelStyle(.iconOnly)
            .frame(width: 60, height: 50)
            .background(
                RoundedRectangle(
                    cornerSize: CGSize(width: 10, height: 10),
                ).foregroundColor(
                    Color(hue: 0.7, saturation: 1, brightness: 1, opacity: 0.8)
                    )
                )
            
            Button(action: { print("eraser.badge.xmark") }) {
                Label("", systemImage: "eraser.badge.xmark").imageScale(.large)
            }
            .foregroundColor(.white)
            .labelStyle(.iconOnly)
            .frame(width: 60, height: 50)
            .background(
                RoundedRectangle(
                    cornerSize: CGSize(width: 10, height: 10),
                ).foregroundColor(
                    Color(hue: 0.7, saturation: 1, brightness: 1, opacity: 0.6)
                    )
                )
            
            Button(action: { print("trash") } ) {
                Label("",systemImage: "trash").imageScale(.large)
            }
            .foregroundColor(.white)
            .labelStyle(.iconOnly)
            .frame(width: 60, height: 50)
            .background(
                RoundedRectangle(
                    cornerSize: CGSize(width: 10, height: 10),
                ).foregroundColor(
                    Color(hue: 0.7, saturation: 1, brightness: 1, opacity: 0.4)
                    )
                )
        }
    }
    
    
    func myPrint() { print("Button Pressed") }
    
    func printHands() { print("hands") }
}

#Preview {
    ContentView()
}
