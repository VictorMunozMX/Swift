//
//  ContentView.swift
//  Q5
//
//  Created by IMD 224 on 2024-03-20.
//

import SwiftUI
import SwiftData
import Observation

@Model class Student: Identifiable, Hashable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    let id = UUID()
    var name: String
    var number: String
    
    init(name: String, number: String) {
        self.name = name
        self.number = number
    }
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var students: [Student]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(students) {item in
                    RowView(students: item)
                }
                .onDelete { indices in
                    indices.forEach { index in
                        let itemToRemove = students[index]
                        modelContext.delete(itemToRemove)
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack{
                        Button(action: {
                            let item = Student(name: "ABC", number: "123")
                            modelContext.insert(item)
                        })
                        {
                            Text("Add")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct RowView: View {
   
    @Bindable var students: Student
    
    var body: some View {
        HStack {
            TextEditor(text: $students.name)
                .font(.system(size: 24))
            TextEditor(text: $students.number)
                .font(.system(size: 24))
        }
        .padding()
    }
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: Student.self)
    }
}
