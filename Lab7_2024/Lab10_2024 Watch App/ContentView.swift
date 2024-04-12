//
//  ContentView.swift
//  Lab10_2024 Watch App
//
//  Created by IMD 224 on 2024-04-04.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}


#Preview {
    MainActor.assumeIsolated {
        ContentView()
            .modelContainer(for: Treasure.self)
    }
}
