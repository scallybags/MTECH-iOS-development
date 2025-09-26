//
//  DogWalka.swift
//  IBBasics
//
//  Created by Andrew Vanderwilt on 9/26/25.
//
import SwiftUI

@Observable class DogWalka {
    var dogs: [Dog]
    var walk: Walk?
    
    init() {
        dogs = []
        walk = nil
    }
}
