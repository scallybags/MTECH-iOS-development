//
//  ContentView.swift
//  mtecApp
//
//  Created by Andrew Vanderwilt on 8/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(String(randomNumber(floor: 10, ceiling: 150)))
        }
        .padding()
    }
    
    func randomNumber(floor: Int, ceiling: Int) -> Int {
        let randomNumber = Int.random(in: floor...ceiling)
        print(randomNumber)
        return randomNumber
    }
}

#Preview {
    ContentView()
}
