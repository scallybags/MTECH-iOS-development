//
//  Note.swift
//  temp
//
//  Created by Andrew Vanderwilt on 11/2/25.
//
import Foundation

struct Note: Codable {
    let title: String
    let text: String
    let timeStamp: Date
}

let newNote = Note(title: "Grocery Run", text: "Pick up mayonnaise", timeStamp: Date())

let propertyListEncoder = PropertyListEncoder()

if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print(encodedNote)

    let propertyListDecoder = PropertyListDecoder()
    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
        print(decodedNote)
    }
}
