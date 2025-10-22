//
//  InventoryLisstView.swift
//  TestingApp
//
//  Created by Andrew Vanderwilt on 10/22/25.
//

import SwiftUI

struct InventoryListView: View {
    @State private var viewModel = InventoryViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.items) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("Qty: \(item.quantity)")
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        viewModel.addItem(name: "Bow", quatity: 2)
                    }
                }
            }
        }
    }
}

#Preview {
    InventoryListView()
}
