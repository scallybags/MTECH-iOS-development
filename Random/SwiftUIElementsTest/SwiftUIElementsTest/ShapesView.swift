//
//  ContentView.swift
//  SwiftUIElementsTest
//
//  Created by Andrew Vanderwilt on 9/30/25.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        ZStack {
//            Color.indigo
//            Color(red: 23/255, green: 12/255, blue: 19/255)
//            Color(hue: 23/360, saturation: 0.5, brightness: 0.5)
//            Color.superYellow
//            
//            Circle()
//                .fill(.superYellow)
//            RoundedRectangle(cornerRadius: 50)
//                .fill(.teal)
//                .stroke(Color.black, lineWidth: 3)
            Circle()
                .foregroundColor(.blue)
                .frame(width: 300)
            ScrollView() {
                VStack{
                    Spacer(minLength: 150)
                    
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(maxWidth: 300)
                        .glassEffect(.clear.tint(.red))
                }
            }
        }
        .padding()
        .ignoresSafeArea()
    }
}
//
#Preview {
    ShapesView()
}
