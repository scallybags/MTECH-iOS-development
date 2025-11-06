//
//  SwiftUIView.swift
//  TestingApp
//
//  Created by Andrew Vanderwilt on 10/30/25.
//

import SwiftUI

struct ErrorHandling: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    
    var body: some View {
        VStack{
            Text("Login")
            
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            
            Button("Login") {
                do {
                    try lookupUsernameAndPassword(email: email, password: password)
                    try validateEmail(email)
                    
                    //login
                    
                } catch {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func lookupUsernameAndPassword(email: String, password: String) throws {
        if !UserDatabase.users.contains(email) {
            throw ValidationError.userNotFound
        }
    }
    
    func validateEmail(_ email: String) throws {
        if email.isValidEmail {
            throw ValidationError.invalidEmail
        }
    }
}

extension String {
    var isValidEmail: Bool {
        if self.contains(".com") {
            return true
        } else {
            return false
        }
    }
}

class UserDatabase {
    static let users: [String] = []
}

enum ValidationError: LocalizedError {
    case userNotFound
    case invalidEmail
    
    var errorDescription: String? {
        switch self {
        case .userNotFound:
            return "User not found"
        case .invalidEmail:
            return "Invalid email"
        }
    }
}

#Preview {
    ErrorHandling()
}
