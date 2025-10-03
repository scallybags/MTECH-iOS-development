//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Andrew Vanderwilt on 10/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Button("print age") {
                user.age = Date(timeIntervalSince1970: 971571041)
                print(user.age)
            }
        }
        .padding()
    }
}

@propertyWrapper
struct AgeLimit {
    private var age: Date = .now
    private var limit: Int = 18
    private var defaultAge: Date {
        Calendar.current.date(byAdding: .year, value: -limit, to: .now)!
    }
    
    var wrappedValue: Date {
        get {
            age
        }
        
        set {
            age = isOverLimit(val: newValue) ? newValue : defaultAge
        }
    }
    
    private func isOverLimit(val: Date) -> Bool {
        guard let difference = Calendar.current.dateComponents([.year], from: val, to:  .now).year else { return false }
        return difference > limit
    }
}

struct User {
    @AgeLimit var age: Date
    
    init(age: Date = .now) {
        self.age = age
    }
}

var user = User()


#Preview {
    ContentView()
}
