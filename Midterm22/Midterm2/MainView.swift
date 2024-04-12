//
//  MainView.swift
//  Midterm2
//
//  Created by IMD 224 on 2024-03-26.
//

//import SwiftUI
//
//@main
//struct Midterm2App: App {
//    var body: some Scene {
//        WindowGroup {
//            MainView()
//        }
//        .modelContainer(for: InventoryItem.self)
//    }
//}


import SwiftUI
import SwiftData

@Model final class InventoryItem: Identifiable {
    let id = UUID()
    var name: String
    var spiciness: String
    //var img: Image
    
    init(name: String, spiciness: String) {
        self.name = name
        self.spiciness = spiciness
        //self.img = img
    }
}

struct MainView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var inventoryItems: [InventoryItem]
    @State private var rating: String = ""
    @State private var total: Int = 0
    
    var body: some View {
        NavigationView {
            //TextField("Max Rating: ", text: $rating)
            List {
                ForEach (inventoryItems) { item in
                    RowView(inventoryItems: item)
                        .swipeActions(edge: .trailing)
                    {
                        Button(role: .destructive)
                        {
                            modelContext.delete(item)
                            total -= 1
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        let item = InventoryItem(name: "Dish", spiciness: "Spiciness")
                        modelContext.insert(item)
                        total += 1
                    })
                    {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        Text("Total: \(total)")
            .font(.system(size: 20))
    }
}

struct RowView: View {
    
    @Bindable var inventoryItems: InventoryItem
    var body: some View {
        HStack {
            TextField("", text: $inventoryItems.name)
                .font(.system(size: 20))
            VStack {
                TextField("", text: $inventoryItems.spiciness)
                    .font(.system(size: 20))
                Image(systemName: "face.smiling")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20, alignment: .leading)
            }
        }
        .padding()
    }
}

#Preview {
    MainActor.assumeIsolated {
        MainView().modelContainer(for: InventoryItem.self)
    }
}
