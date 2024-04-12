//
//  Lab1_2024App.swift
//  Lab1_2024
//
//  Created by IMD 224 on 2024-01-24.
//

import SwiftUI
import SwiftData

@main
struct Lab1_2024App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: InventoryItem.self)
    }
}
