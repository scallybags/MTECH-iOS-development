//
//  MainTabView.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MyRecipesScreen()
                .tabItem {
                    Label("My Recipes", systemImage: "fork.knife.circle")
                }
            DiscoverScreen()
                .tabItem {
                    Label("Discover", systemImage: "desktopcomputer")
                }
        }
    }
}



#Preview {
    MainTabView()
}
