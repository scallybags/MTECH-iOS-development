//
//  FamilyScreen.swift
//  MeetMyFamily
//
//  Created by Andrew Vanderwilt on 10/9/25.
//
import SwiftUI

struct FamilyScreen: View {
    @State var memberList = members
    @State var selectedFamilyMember: Member?
    
    var body: some View {
        NavigationStack {
            List($memberList) { $member in
                Button {
                    selectedFamilyMember = member
                    member.viewed = true
                } label: {
                    HStack {
                        member.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        Text(member.name)
                            .font(.custom("Thonburi", size: 25))
                            .foregroundColor(.black)
                        if member.viewed == false {
                            Text("❌")
                        } else {
                            Text("✅")
                        }
                    }
                }
            }
            .sheet(item: $selectedFamilyMember) { member in
                NavigationStack{
                    MemberDetailScreen(member: member)
                }
            }
        }
    }
}



#Preview {
    FamilyScreen()
}
