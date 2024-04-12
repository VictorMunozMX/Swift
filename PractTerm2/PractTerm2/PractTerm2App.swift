//
//  PractTerm2App.swift
//  PractTerm2
//
//  Created by IMD 224 on 2024-03-26.
//

import SwiftUI

@main
struct PractTerm2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Message.self)
    }
}
