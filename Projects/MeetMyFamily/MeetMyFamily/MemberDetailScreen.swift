//
//  memberDetailScreen.swift
//  MeetMyFamily
//
//  Created by Andrew Vanderwilt on 10/9/25.
//
import SwiftUI

struct MemberDetailScreen: View {
    let member: Member
    
    var body: some View {
        member.image
            .resizable()
            .scaledToFit()
            .frame(width: 320, height: 320)
        Text(member.name)
        Text("Age: \(member.age)")
        Text(member.occupation)
    }
}

#Preview {
    MemberDetailScreen(member:
        Member(
            name: "Quen",
            age: 22,
            image: Image(.quen),
            occupation: "Warehouse Worker"
        )
    )
}
