//
//  MyModifier.swift
//  ViewModifierExamples
//
//  Created by Toby Youngberg on 9/15/25.
//

import SwiftUI

struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.white)
            .padding(15)
            .background(.green)
            .frame(width: 150, height: 75)
            .border(.black, width: 2)
            .overlay(content:
                      {Color(hue: 0.5, saturation: 0, brightness: 0.5, opacity: 0.5)}
            )
            .position(CGPoint(x: 50, y: 50))
            .offset(x:175 , y:0)
    }
}

struct EpicMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(Gradient(colors: [.blue,.brown]))
            .padding(10)
            .background(Gradient(colors: [.brown,.clear]))
            .border(.brown, width: 1)
            .offset(x: 0 , y: -100)
    }
}

extension View {
    func myModifier() -> some View {
        modifier(MyModifier())
    }
    
    func epicMod() -> some View {
        modifier(EpicMod())
    }
}
