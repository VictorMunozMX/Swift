//
//  Lab10_2024App.swift
//  Lab10_2024 Watch App
//
//  Created by IMD 224 on 2024-04-04.
//

import SwiftUI

@main
struct Lab10_2024_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Treasure.self)
    }
}
