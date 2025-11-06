//
//  SavingShit.swift
//  TestingApp
//
//  Created by Andrew Vanderwilt on 10/31/25.
//

import SwiftUI

struct SavingShit: View {
    
    @AppStorage("favoriteColor") var favoriteColor: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("App Storage Example.")) {
                    TextField("Fav Color", text: $favoriteColor)
                    Text("App Storage Value: \(favoriteColor)")
                }
            }
            .navigationTitle("Saving Test")
        }
    }
}

#Preview {
    SavingShit()
}
