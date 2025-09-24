//
//  TopFiveFriendsView.swift
//  SwiftUITextLab
//
//  Created by Andrew Vanderwilt on 9/23/25.
//

import SwiftUI

struct TopFiveFriendsView: View {
    var body: some View {
        Text("Top 5 friends:")
        Text("1. Olivia🥰")
            .font(.custom("Chalkduster", size: 20))
            .foregroundStyle(.pink)
        
        Text("2. Quen🥸")
            .font(.custom("Chalkboard", size: 20))
            .foregroundStyle(.green)
        
        Text("3. Dakota⚙️")
            .font(.custom("Chalkboard", size: 20))
            .foregroundStyle(.purple)
        
        Text("4. Jonny🤡")
            .foregroundStyle(.orange)
            .font(.custom("Chalkboard", size: 20))
        
        Text("5. Sergio🚥")
            .foregroundStyle(.blue)
            .font(.custom("Chalkboard", size: 20))
    }
}

#Preview {
    TopFiveFriendsView()
}
