//
//  ContentView.swift
//  Treasure_app
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            Agenda()
                .tabItem {
                    Label("Agenda", systemImage: "play.fill")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: InventoryItem.self)
    }
}
