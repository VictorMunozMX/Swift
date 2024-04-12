//
//  MainView.swift
//  Lab1_2024
//
//  Created by IMD 224 on 2024-01-26.
//

import SwiftUI
import SwiftData

let defaultChars = UserDefaults.standard.object(forKey: "maxCharacter") as? Int ?? 100
//let defaultToggle = UserDefaults.standard.object(forKey: "toggleChange") as? Bool ?? false
let defaultColour = array2color(array: UserDefaults.standard.object(forKey: "backColour") as? [CGFloat] ?? color2array(colour: Color.yellow))

struct MainView: View {
    @State private var showSettings = false
    @State private var colour = defaultColour
    @State private var value = defaultChars
    //Lab 4
//    @State private var inventoryItems = [InventoryItem(image: "hare", details: ""), InventoryItem(image: "tortoise", details: "")]
    
    //Lab 5
    @Query private var inventoryItems: [InventoryItem]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack() {
            VStack {
                if showSettings {
                    SettingsView(colour: $colour, value: $value)
                }
                else
                {
                    //DetailView(colour: colour, value: value)
                    List(inventoryItems) {
                        inventoryItem in
                        NavigationLink(
                            destination: DetailView(colour: colour, value: value, inventoryItem: inventoryItem)
                        ) {
                            RowView(inventoryItem: inventoryItem, colour: colour)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive) {
                                        let item = inventoryItem
                                        modelContext.delete(item)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                                .accessibilityIdentifier("Delete")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Inventory"))
            .toolbar {
                ToolbarItemGroup{
                    Button(
                        action: {showSettings.toggle()
                        },
                        label: {
                            Image(systemName: showSettings ? "house" : "gear")
                        }
                    )
                    .accessibilityIdentifier("NavigatorButton")
                    if !showSettings {
                        Button(
                            action: {
                                withAnimation {
                                    let item = InventoryItem(image: "ladybug", details: "Ladybug")
                                    modelContext.insert(item)
                                }
                            },
                            label: {
                                Image(systemName: "plus")
                            }
                        )
                        .accessibilityIdentifier("PlusButton")
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
