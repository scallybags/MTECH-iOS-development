//
//  PropertyWrappers2App.swift
//  PropertyWrappers2
//
//  Created by Andrew Vanderwilt on 10/2/25.
//

import SwiftUI

@main
struct PropertyWrappers2App: App {
    let vm = CounterViewModel(count: 0)
    
    var body: some Scene {
        WindowGroup {
            ContentView(counterViewModel: vm)
        }
    }
}
