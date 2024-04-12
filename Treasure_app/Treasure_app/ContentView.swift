//
//  ContentView.swift
//  Treasure_app
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI
import SwiftData

/// Main view, it has two option for the APP.
/// Game tab, you can see the grid with images and play.
/// Settings, you can setup your play
struct ContentView: View {
    
    /// Contain tab for Game and tab for Settings
    var body: some View {
        /// Tab options, in this case Game and Settings
        TabView {
            PlayView()
                .tabItem {
                    Label("Game", systemImage: "play.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Setting", systemImage: "gear")
                }
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: InventoryItem.self)
    }
}
