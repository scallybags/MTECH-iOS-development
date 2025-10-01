//
//  ContentView.swift
//  Hotel Registration App
//
//  Created by Jane Madsen on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            HotelRegistrationScreen()
        }
    }
}

struct HotelRegistrationScreen: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var doorCode = ""
    @State private var numberOfGuests = 0
    @State private var lengthOfStay = 0
    @State private var nonSmoking = true
    @State private var registration = 1
    
    private let pickerNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    
    var body: some View {
        VStack {
            HStack {
                Image("mountainlandLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                
                Text("Mountainland Inn")
                    .font(.custom("Verdana", size: 20))
                    .bold()
                    .foregroundStyle(Color.background)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.highlight)
                    }
            }
            .frame(width: 380)
            .background(
                RoundedRectangle(
                    cornerRadius: 25
                )
                .foregroundColor(Color.background)
            )
            
            
            TextField("First Name", text: $firstName).padding()
            
            TextField("Last Name", text: $lastName).padding()
            
            SecureField("Door Code", text: $doorCode).padding()
            
            Picker("Number of Guests", selection: $numberOfGuests) {
                ForEach(pickerNumbers, id: \.self) { number in
                    Text(String(number))
                }
            }
            .foregroundColor(.black)
            
            Stepper("Length of Stay \(lengthOfStay)", value: $lengthOfStay)
            
            Toggle("Non Smoking", isOn: $nonSmoking)
            
            Spacer()
            
            Text("Welcome!")
                .font(.custom("Rockwell", size: 20))
                .foregroundStyle(.text)
            
            Spacer()
            
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
