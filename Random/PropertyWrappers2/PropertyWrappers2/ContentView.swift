//
//  ContentView.swift
//  PropertyWrappers2
//
//  Created by Andrew Vanderwilt on 10/2/25.
//

import SwiftUI

struct ContentView: View {
    @Bindable var counterViewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("Count: \(counterViewModel.count)")
            
            Text("")
            
            Button("Incriment") {
                counterViewModel.incriment()
            }
            
            Button("Resest") {
                counterViewModel.reset()
            }
        }
        .padding()
    }
}

#Preview {
    var vm = CounterViewModel(count:0)
    ContentView(counterViewModel: vm)
}
