//
//  ContentView.swift
//  NavDemo
//
//  Created by Andrew Vanderwilt on 10/8/25.
//

import SwiftUI

struct Student: Identifiable {
    var id: UUID = UUID()
    var name: String
    var favoriteColor: Color
}

let students = [
    Student(name: "Andrew", favoriteColor: .green),
    Student(name: "Ed", favoriteColor: .blue),
    Student(name: "Bob", favoriteColor: .blue),
    Student(name: "Lori", favoriteColor: .pink),
    Student(name: "Dan", favoriteColor: .yellow),
]

struct ContentView: View {
    
    @State private var isPresentingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Display Sheet") {
                    isPresentingSheet = true
                }
                List(students) { student in
                    NavigationLink {
                        student.favoriteColor.ignoresSafeArea()
                    } label: {
                        Text(student.name)
                    }
                    
                }
                .navigationTitle("Students")
                .sheet(isPresented: $isPresentingSheet) {
                    Text("Sheet happens")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
