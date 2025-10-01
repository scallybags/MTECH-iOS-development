//
//  SodaListView.swift
//  SodaApp
//
//  Created by Andrew Vanderwilt on 10/1/25.
//

import SwiftUI

@Observable class SodaLibrary {
    var sodas: [String] = [
        "Coke"
    ]
}

struct SodaListView: View {
    @State var sodaLibrary = SodaLibrary()
    @State var newSodaName: String = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SodaListView()
}
