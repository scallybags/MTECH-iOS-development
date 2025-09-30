//
//  ContentView.swift
//  ProfileLab
//
//  Created by Andrew Vanderwilt on 9/25/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var quests: [Quest] = [
        Quest(title: "10,000 steps", progress: 0),
        Quest(title: "Code 1 hour", progress: 0),
        Quest(title: "Workout 1 hour", progress: 0),
        Quest(title: "Work 5.5 hours", progress: 0),
        Quest(title: "10,000 steps", progress: 0),
    ]
    
    var body: some View {
        let userName = "Andy"
        
        let todaysDate = "9/26/25"
        
        var expToday = 0
        
        var moneyToday = 0
        
        
        
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text(userName)
                        .font(.system(size: 20))
                    Text("Questlog")
                        .foregroundStyle(Color(white: 0,opacity: 0.5))
                }
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(Color(white: 0.9))
                VStack(alignment: .leading) {
                    HStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(Color(hue: 1, saturation: 0, brightness: 1))
                            
                            Text("Date: \n \(todaysDate)")
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(Color(hue: 1, saturation: 0, brightness: 1))
                            
                            Text("Exp: \n \(expToday)")
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(Color(hue: 1, saturation: 0, brightness: 1))
                            
                            Text("$ Today: \n $\(moneyToday)")
                        }
                    }
                    .scaledToFit()
                    .padding()
                    
                    buildQuestView()
                    .padding()
                    
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func buildQuestView() -> some View {
        VStack(alignment: .leading) {
            Text("-Quests-")
                .font(.largeTitle)
                .underline()
            HStack {
                VStack{
//                                ForEach(quests)
                }
                
                VStack(alignment: .leading) {
                    ForEach(quests.enumerated(), id: \.offset) { index, quest in
                        HStack {
                            Button(quest.progress == 100 ?"☑︎":"☐") {
                                quests[index].complete()
                            }.foregroundColor(.black)
                            Text(quest.title)
                            Spacer()
                            Text("\(quest.progress)%")
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
