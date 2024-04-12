////
////  ContentView.swift
////  PractTerm2
////
////  Created by IMD 224 on 2024-03-26.
////

import SwiftUI
import SwiftData

//@Model final class Address: Identifiable {
//
//    var fullName: String
//    var email: String
//    
//    init(fullName: String, email: String) {
//        self.fullName = fullName
//        self.email = email
//    }
//}
//
//struct ContactView: View {
//    @Bindable var contact: Address
//    
//    var body: some View {
//        HStack {
//            TextField("Full Name", text: $contact.fullName)
//            TextField("Email", text: $contact.email)
//        }
//    }
//}
// UNOOOOOO
//struct ContentView: View {
//    
//    @Environment(\.modelContext) private var modelContext
//    @Query private var addresses: [Address]
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(addresses) { contact in
//                    ContactView(contact: contact)
//                }
//                .onDelete {
//                    if let index = $0.first {
//                        modelContext.delete(addresses[index])
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Addresses"))
//            .toolbar {
//                ToolbarItemGroup {
//                    Button(
//                        action: {
//                            withAnimation {
//                                modelContext.insert(Address(fullName: "Someone", email: //"someone@somewhere"))
//                            }
//                        }
//                    ) {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    MainActor.assumeIsolated {
//        ContentView().modelContainer(for: Address.self)
//    }
//}

// DOSSSSSSS
//@Model final class Event: Identifiable {
//    var name: String
//    var date: Date
//    
//    init(name: String, date: Date) {
//        self.name = name
//        self.date = date
//    }
//}
//
//struct EventView: View {
//    @Bindable var event: Event
//    
//    var body: some View {
//        HStack {
//            TextField("Full Name", text: $event.name)
//            DatePicker(selection: $event.date, label: { Text("Date") })
//        }
//    }
//}
//
//struct ContentView: View {
//    @Query private var events: [Event]
//    @Environment(\.modelContext) private var modelContext
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(events) { e in
//                    EventView(event: e)
//                }
//                .onDelete {
//                    if let index = $0.first {
//                        modelContext.delete(events[index])
//                    }
//                }
//            }
//            .navigationBarTitle(Text("Events"))
//            .toolbar {
//                ToolbarItemGroup {
//                    EditButton()
//                    Button(
//                        action: {
//                            withAnimation {
//                                modelContext.insert(Event(name: "Quiz", date: Date()))
//                            }
//                        }
//                    ) {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    MainActor.assumeIsolated {
//        ContentView().modelContainer(for: Event.self)
//    }
//}

//TRESSSSSSS
@Model
final class Message: Identifiable {
    var message: String
    
    init(message: String) { // Required for @Model
        self.message = message
    }
}

struct ContentView: View {
    @Query private var messages: [Message]
    @Environment(\.modelContext) private var modelContext
    @State private var message = ""
    
    var body: some View {
        VStack {
            TextField("Message", text: $message)
            Button(action: {
                messages.first?.message = message
            }, label: {
                Text("Save")
            })
        }
        .onAppear() {
            if let msg = messages.first?.message {
                message = msg
            }
            else {
                modelContext.insert(Message(message: ""))
            }
        }
    }
}

#Preview {
    ContentView()
}
