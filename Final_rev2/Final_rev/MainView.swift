//
//  ContentView.swift
//  Final_rev
//
//  Created by IMD 224 on 2024-04-12.
//

import SwiftUI
import SwiftData

struct MainView: View {
    var body: some View {
        TabView {
            Settings()
                .tabItem {
                    Label("Set-Up", systemImage: "gear") }
            Play()
                .tabItem {
                    Label("Play", systemImage: "play") }
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        MainView().modelContainer(for: InventoryItem.self)
    }
}
