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
    @State private var numberOfGuests = 1
    @State private var lengthOfStay = 0
    @State private var nonSmoking = true
    @State private var submitted = false
    @State private var registrationFeedback: Double = 5
    
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
            
            Text("Welcome!")
                .font(.custom("Rockwell", size: 20))
                .foregroundStyle(.text)
            
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
            
            ZStack {
                Capsule().foregroundColor(.highlight)
                
                Button(action: {submitted = true}) {
                    Text("Submit")
                }
                .foregroundColor(Color.background)
            }
            .frame(width: 90, height: 40)
            
            
            if submitted == true {
                Text("Thank you for booking with us").padding()
                Text("How would you rate your booking experience?")
                Text("\(Int(registrationFeedback))/5⭐️").padding()
                Slider(value: $registrationFeedback, in: 0...5, step: 1) { }
            }
            
            Spacer()
            
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
