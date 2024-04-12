//
//  ContentView.swift
//  Practice_20240306
//
//  Created by IMD 224 on 2024-03-06.
//


import SwiftUI
import SwiftData

@Model class Ingredient: Identifiable {
    var name: String
    var required: Bool
    init(name: String, required: Bool) {
        self.name = name
        self.required = required
    }
}

@main
struct LectureApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: Ingredient.self)
        }
    }
}

struct DetailView : View {
    @Bindable var ingredient : Ingredient
    var body: some View {
        VStack {
            TextField("Ingredient", text: $ingredient.name)
            Toggle("Required", isOn: $ingredient.required)
        }
    }
}

struct MainView: View {
    @Query private var ingredients : [Ingredient]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List(ingredients) {
                i in
                NavigationLink(destination: DetailView(ingredient: i)) {
                    Text("\(i.name)")
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        modelContext.insert(Ingredient(name: "?", required: false))
                    })
                    {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
