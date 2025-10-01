//
//  ControlsView.swift
//  SwiftUIElementsTest
//
//  Created by Andrew Vanderwilt on 9/30/25.
//

import SwiftUI

struct ControlsView: View {
    @State var isOn = false
    @State var textFieldString = ""
    @State var secureFieldString = ""
    @State var sliderValue = 0.0
    @State private var pickerValue = "Option 1"
    
    var body: some View {
        VStack {
            Toggle("This is a toggle", isOn: $isOn)
            
            Toggle(isOn: $isOn) {
                Image(systemName: "trash")
                    .foregroundColor(.black)
            }
            
            TextField(
                "This is a text field",
                text: $textFieldString,
                prompt: Text(
                    "This is a prompt"
                )
                    .font(.custom("Papyrus", size: 20))
            )
            
            SecureField("this is a secure text field", text: $secureFieldString)
            
            VStack {
                Text("\(sliderValue)")
                
                Slider(value: $sliderValue)
            }
            
            Picker("My Picker", selection: $pickerValue) {
                ForEach(["Option 1","Option 2", "Option 3"],
                        id: /.self ) { item in
                    Text(item)
                        .tag(item)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ControlsView()
}
