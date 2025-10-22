//
//  Item.swift
//  TestingApp
//
//  Created by Andrew Vanderwilt on 10/22/25.
//
import Foundation

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
}
