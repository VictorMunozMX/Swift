//
//  SettingsView.swift
//  Treasure_app
//
//  Created by IMD 224 on 2024-02-26.
//
import SwiftUI
import SwiftData
import Foundation

/// This class is the definition of this Inventory and it has an ID, Label and Value.
/// Besides, is the model that is applied in this app
@Model class InventoryItem: Identifiable, Hashable {
    /// id is a key unique
    let id = UUID()
    /// Label is the name for each element
    var label: String
    /// Value is the quantity for each element
    var value: Int
    
    /// The initializer
    /// - Parameters:
    ///   - label: first time is assigned to circle
    ///   - value: first time is assigned with 1
    init(label: String, value: Int) {
        self.label = "Circle"
        self.value = 1
    }
}

/// Setting view is where you can set up your play with one or more elements and the value of each one.
struct SettingsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var inventoryItems: [InventoryItem]
    
    /// View where is display the option that your are adding.
    /// Each element has the name and the value.
    /// Is possible to edit the list of the elements, you can delete or add
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
            .navigationTitle("Treasures")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            let item = InventoryItem(label: "Cat", value: 1)
                            modelContext.insert(item)
                        })
                        {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}


/// Create every row added to the Settigns view.
/// It has two option, the name of the element and tjhe value of each element.
struct RowView: View {
    /// This is Bindable to see the inventoryItems in this struc
    @Bindable var inventoryItems: InventoryItem
    
    /// Create a Horizontal element with two option Label and Value
    /// Label, the name of each image
    /// Value, the number of images in the play
    var body: some View {
        HStack {
            TextEditor(text: $inventoryItems.label)
                .font(.system(size: 24))
            Stepper(value: $inventoryItems.value, in: 1...10)
            {
                Text(String(inventoryItems.value))
                    .font(.system(size: 24))
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: InventoryItem.self)
    }
}
