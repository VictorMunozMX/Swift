//
//  Midterm2App.swift
//  Midterm2
//
//  Created by IMD 224 on 2024-03-25.
//

import SwiftUI

@main
struct Midterm2App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: InventoryItem.self)
    }
}
