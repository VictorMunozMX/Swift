//
//  Agenda.swift
//  PracticeModel
//
//  Created by IMD 224 on 2024-03-19.
//

import SwiftUI
import SwiftData

struct Agenda: View {
     
    @Query private var inventoryItems: [InventoryItem]
    @State private var totalAgenda: Int = 0
    
    var body: some View {
        VStack{
            Text("Agenda")
                .font(.system(size: 40))
            Spacer()
            ForEach(inventoryItems) { item in
                HStack{
                    Text(item.name)
                    Text(item.phone)
                }
                .font(.system(size: 25))
            }
            Spacer()
            Text("Total: " + String(inventoryItems.count))
                .font(.system(size: 25))
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: InventoryItem.self)
    }
}
