//
//  Final_revApp.swift
//  Final_rev
//
//  Created by IMD 224 on 2024-04-12.
//

import SwiftUI

@main
struct Final_revApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: InventoryItem.self)
    }
}
