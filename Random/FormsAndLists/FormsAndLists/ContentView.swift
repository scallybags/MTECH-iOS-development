//
//  ContentView.swift
//  FormsAndLists
//
//  Created by Andrew Vanderwilt on 10/7/25.
//

import SwiftUI


struct ContentView: View {
    let carsArray = [
        Car(id: "Toyota Camery" , make: "Toyota", model: "Camry", year: 1998),
        Car(id: "Acura TL" , make: "Acura", model: "TL", year: 2006),
        Car(id: "Ford Ranger", make: "Ford", model: "Ranger", year: 2001)
    ]

    var body: some View {
        NavigationStack{
            List(carsArray) { car in
                NavigationLink(destination: FormView(car: car) ) {
                    FormView(car: car)
                } label: {
                    VStack(alignment: .leading) {
                        Text(car.make)
                        Text(car.model)
                        Text(car.year.formatted(.number.grouping(.never)))
                    }
                }
            }
        }
    }
}

struct FormView: View {
    @State var car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    var body: some View {
        Form {
            TextField("Make", text: $car.make)
            
        }
    }
}

#Preview {
    ContentView()
}
