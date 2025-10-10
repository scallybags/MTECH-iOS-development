//
//  FamilyScreen.swift
//  MeetMyFamily
//
//  Created by Andrew Vanderwilt on 10/9/25.
//
import SwiftUI

struct FamilyScreen: View {
    var body: some View {
        NavigationStack {
            List(members) { member in
                NavigationLink {
                    MemberDetailScreen(member: member)
                } label: {
                    Text(member.name)
                }
            }
        }
    }
}

#Preview {
    FamilyScreen()
}
