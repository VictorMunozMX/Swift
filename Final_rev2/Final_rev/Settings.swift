//
//  Settings.swift
//  Final_rev
//
//  Created by IMD 224 on 2024-04-12.
//

import SwiftUI
import SwiftData

@Model class InventoryItem: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var cantidad: Int
    
    init(name: String, cantidad: Int) {
        self.name = name
        self.cantidad = cantidad
    }
}

struct Settings: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var inventoryItems: [InventoryItem]
    
    var body: some View {
        NavigationView {
            List{
                ForEach(inventoryItems) { i in
                    RowView(inventoryItems: i)
                }
                .onDelete { indices in
                    indices.forEach { index in
                        let itemToRemove = inventoryItems[index]
                        modelContext.delete(itemToRemove)
                    }
                }
            }
            .navigationTitle("VideoGame")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button(action: {
                        let item = InventoryItem(name: "cat", cantidad: 1)
                        modelContext.insert(item)
                    })
                    {
                        Image(systemName: "plus")
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

#Preview {
    MainActor.assumeIsolated {
        MainView().modelContainer(for: InventoryItem.self)
    }
}
