//
//  ProfileView.swift
//  SwiftUITextLab
//
//  Created by Andrew Vanderwilt on 9/23/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
        
        Text("User: FrankDaTank")
            .font(.custom("Galvji", size: 20))
            . foregroundStyle(.purple)
        
        Text("Frank Einstein")
            .font(.custom("Avenir Next", size: 20))
            .foregroundStyle(.pink)
        
        Text("Hometown: Nashville")
            .font(.custom("Hoefler", size: 15))
            .foregroundStyle(.cyan)
        
        Text("Bio: Music lover, dreamer, and adventure seeker. Always in my thoughts, but never too far from the moment. Exploring the world one song, one step, one smile at a time. Passionate about living life on my own terms." )
            .font(.custom("Bononi 72", size: 22))
            .foregroundStyle(.green)
        
    }
}

#Preview {
    ProfileView()
        .onAppear {
            print(UIFont.familyNames)
        }
}
