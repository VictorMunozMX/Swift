//
//  Play.swift
//  Final_rev
//
//  Created by IMD 224 on 2024-04-12.
//

import SwiftUI
import SwiftData

struct Play: View {
    
    @Query private var inventoryItems: [InventoryItem]
    
    @State private var count    = 175.0
    @State private var count2   = 350.0
    @State private var randomDirection = 0
    @State private var destination = CGPoint(x: 350, y: 650)
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    //Example Animation
    var body: some View {
        VStack {
            ForEach(inventoryItems) { i in
                Text(i.name)
                Image(systemName: i.name.lowercased())
                    .position(x: count, y: count2)
            }
        }
        .padding()
        .onReceive(timer) { _ in
            
            let deltaX = destination.x - count
            let deltaY = destination.y - count2
            let distance = sqrt(deltaX * deltaX + deltaY * deltaY)
            let speed = 25.0 // Pixels per second
            let duration = distance / speed
            
            withAnimation(.easeInOut(duration: duration)) {
                count = destination.x
                count2 = destination.y
            }
        }
    }
    
    //    // moving with toggle
    //    @State private var left     = false
    //    @State private var right    = false
    //    @State private var down     = false
    //    @State private var up       = false
    //    var body: some View {
    //        VStack {
    //            Image(systemName: "ladybug")
    //                .position(x: count, y: count2)
    //            HStack {
    //                Toggle("Left",
    //                       isOn: Binding(
    //                        get: {
    //                            left
    //                        }, set: { newValue in
    //                            left = newValue
    //                            count = max(0, count - 10)
    //                        }))
    //                Toggle("Right",
    //                       isOn: Binding(
    //                        get: {
    //                            right
    //                        }, set: { newValue in
    //                            right = newValue
    //                            count = min(325, count + 10)
    //                        }))
    //                Toggle("Up",
    //                       isOn: Binding(
    //                        get: {
    //                            up
    //                        }, set: { newValue in
    //                            up = newValue
    //                            count2 = max(0, count2 - 10)
    //                        }))
    //                Toggle("Down",
    //                       isOn: Binding(
    //                        get: {
    //                            down
    //                        }, set: { newValue in
    //                            down = newValue
    //                            count2 = min(650, count2 + 10)
    //                        }))
    //            }
    //        }
    //        .padding()
    //    }
    
    //    @State var counting = 0
    //    var body: some View {
    //        VStack {
    //            Image(systemName: counting == 2 ? "circle.fill" : "circle")
    //                .foregroundColor(.red)
    //            Image(systemName: counting == 1 ? "circle.fill" : "circle")
    //                .foregroundColor(.yellow)
    //            Image(systemName: counting == 0 ? "circle.fill" : "circle")
    //                .foregroundColor(.green)
    //        }
    //        .padding()
    //        .border(.black)
    //        .onReceive(timer) { _ in
    //            counting = (counting + 1) % 3
    //        }
    //    }
    
    //    // 4 TrafficLight
    //    @State var counting = 0
    //    var body: some View {
    //        VStack {
    //            TrafficLight(count: counting) // 0,1,2,3,4,5
    //            HStack {
    //                TrafficLight(count: (counting + 2) % 5) // 2,3,4,0,1,2
    //                Image(systemName: "cross")
    //                    .resizable()
    //                    .frame(height:50)
    //                TrafficLight(count: (counting + 2) % 5)
    //            }
    //            TrafficLight(count: counting)
    //        }
    //        .padding()
    //        .onReceive(timer) { _ in
    //            counting = (counting + 1) % 6
    //        }
    //    }
    
}

struct TrafficLight: View {
    var count: Int
    
    var body: some View {
        VStack {
            Image(systemName: count >= 2 ? "circle.fill" : "circle")
                .foregroundColor(.red)
            Image(systemName: count == 1 ? "circle.fill" : "circle")
                .foregroundColor(.yellow)
            Image(systemName: count == 0 ? "circle.fill" : "circle")
                .foregroundColor(.green)
        }
        .padding()
        .border(.black)
    }
}


#Preview {
    MainActor.assumeIsolated {
        MainView().modelContainer(for: InventoryItem.self)
    }
}
