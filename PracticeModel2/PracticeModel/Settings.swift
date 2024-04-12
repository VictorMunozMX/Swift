//
//  Settings.swift
//  PracticeModel
//
//  Created by IMD 224 on 2024-03-19.
//

import SwiftUI
import SwiftData
//import Observation

@Model class InventoryItem: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var phone: String
    
    init(name: String, phone: String) {
        self.name = "Victor"
        self.phone = "778-1234"
    }
}

struct Settings: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var inventoryItems: [InventoryItem]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(inventoryItems) {item in
                     Section {
                         RowView(inventoryItems: item)
                     }
                }
                .onDelete { indices in
                    indices.forEach { index in
                        let itemToRemove = inventoryItems[index]
                        modelContext.delete(itemToRemove)
                    }
                }
            }
            .navigationTitle("Agenda")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button(action: {
                        let item = InventoryItem(name: "Victor", phone: "778-1234")
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

struct RowView: View {
    
    @Bindable var inventoryItems: InventoryItem
    
    var body: some View {
        HStack {
            TextField("", text: $inventoryItems.name)
                .font(.system(size: 24))
            TextField("", text: $inventoryItems.phone)
                .font(.system(size: 24))
        }
        .padding()
    }
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: InventoryItem.self)
    }
}

