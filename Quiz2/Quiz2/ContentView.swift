//
//  ContentView.swift
//  Test2
//
//  Created by IMD 224 on 2024-02-05.
//

import SwiftUI

//struct ContentView: View {
//    @State var T1 = true
//    @State var T2 = false	
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "person.fill")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, Michael!")
//            
//            Toggle(isOn: Binding(
//                get: {T1},
//                set: {
//                    new in T2 = T1
//                    T1 = new
//                    }
//                )
//            ){
//                Text("Value")
//            }
//            Toggle(isOn: Binding(
//                get: {T2},
//                set: {
//                    new in T1 = T2
//                    T2 = new
//                    }
//                )
//            ){
//                Text("Opposite Value")
//            }
//        }
//    }
//}

//struct ContentView: View {
//    //    @State var T1 = true
//    //    @State var T2 = false
//    @State var s = ""
//    @State var t = ""
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "person.fill")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, Michael!")
//            
//            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: Binding(
//                get: {s},
//                set: {
//                    new in
//                    s = new
//                    t = String(new.reversed())
//                }))
//            
//            TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: Binding(
//                get: {t},
//                set: {
//                    new in
//                    s = new
//                    t = String(new.reversed())
//                }))
//        }
//    }
//}

struct ContentView: View {
    
    @State var veces = 0
    @State var colour = Color.red
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Michael!")
            
            ColorPicker("Colour", selection: Binding(
                get: {colour},
                set: {
                    new in
                    colour = new
                    veces += 1
                }
            )
            )
            Text("Select a colour " + String(veces) + " times so far")
        }
    }
}

#Preview {
    ContentView()
}
