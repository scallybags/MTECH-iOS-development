//
//  ContentView.swift
//  LifecycleLab
//
//  Created by Andrew Vanderwilt on 10/21/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State var events = "Events:"
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text(events)
                    .onChange(of: scenePhase) {_, newPhase in
                        switch newPhase {
                        case .inactive:
                            events.append(" App Inactive,")
                        case .active:
                            events.append(" App Active,")
                        case .background:
                            events.append(" App Backgrounded,")
                        @unknown default:
                            break
                        }
                    }
                NavigationLink("Go") {
                    Text("Navigated")
                        .onAppear {
                            print("appeared")
                        }
                        .onDisappear {
                            print("disappeared")
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
