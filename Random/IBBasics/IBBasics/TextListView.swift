//
//  SwiftUIView.swift
//  IBBasics
//
//  Created by Andrew Vanderwilt on 9/23/25.
//

import SwiftUI

struct TextListView: View {
    var body: some View {
        Text("Hello, swift.")
            .font(.largeTitle)
            .foregroundStyle(.black)
            .italic()
        Text("string")
            .font(.custom("Geeza Pro", size: 26))
            .foregroundStyle(Gradient(colors: [.blue, .yellow]))
        
        Text("another element")
            .font(.system(.title2, weight: .bold))
    }
}

#Preview {
    TextListView()
}
