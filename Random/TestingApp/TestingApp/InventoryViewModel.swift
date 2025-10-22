//
//  InventoryViewModel.swift
//  TestingApp
//
//  Created by Andrew Vanderwilt on 10/22/25.
//

import Foundation
import SwiftUI

@Observable
class InventoryViewModel {
    enum LoadingState {
        case loading, loaded, error
    }
    
    var loadingState: LoadingState = .loading
    
    var items: [Item] = [
        Item(name: "Sword", quantity: 1),
        Item(name: "Sword", quantity: 1),
        Item(name: "Sword", quantity: 1),
    ]
    
    func addItem(name: String, quatity: Int) {
        let newItem = Item(name: name, quantity: quatity)
        items.append(newItem)
    }
    
    func loadItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.loadingState = .loaded
        }
    }
}
