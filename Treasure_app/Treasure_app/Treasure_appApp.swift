//
//  Treasure_appApp.swift
//  Treasure_app
//
//  Created by IMD 224 on 2024-02-26.
//

import SwiftUI

@main
struct Treasure_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: InventoryItem.self)
    }
}
