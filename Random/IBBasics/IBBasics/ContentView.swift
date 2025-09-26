//
//  ContentView.swift
//  IBBasics
//
//  Created by Andrew Vanderwilt on 9/22/25.
//

import SwiftUI

/*
 1 request your dog to be walked
 2 how many dogs to be walked
 3 specify the names of dogs
 */





struct ContentView: View {
    
    @State var dogApp = DogWalka()
    
    @State var newDogName = ""
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Dog Walker")
                .font(.largeTitle)
            VStack {
                Text("My Dogs")
                    .font(.largeTitle)
                ForEach(dogApp.dogs) { dog in
                    Text(dog.name)
                }
            }
            
            Spacer()
            
            TextField("New Dog Name", text: $newDogName)
                .font(.largeTitle)
            
            Button(
                action: { addDog() },
                label: {
                    HStack {
                        Text("Add a dog")
                        Image(systemName: "dog.fill")
                        Spacer()
                    }
                }
            )
            .font(.largeTitle)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    func addDog() {
        guard !newDogName.isEmpty else { return }
        dogApp.dogs.append(Dog(name: newDogName))
        newDogName = ""
        print(dogApp.dogs)
    }
}

#Preview {
    ContentView()
}
