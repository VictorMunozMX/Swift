//
//  PlayView.swift
//  Treasure_app
//
//  Created by IMD 224 on 2024-02-26.
//
import SwiftUI
import SwiftData
import Observation

/// Class Tile to create each element inside of the Tiles array.
/// Observable, to allow see the class
/// Identifiable, To make unique each Tile
@Observable class Tile: Identifiable, Hashable {
    
    static func == (lhs: Tile, rhs: Tile) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    /// elements defined into the classs ID, item, is reveled
    var id = UUID()
    var item: String
    var isReveled: Bool = false
    
    init(item: String) {
        self.item = item
    }
}

/// Class Board to create the array tiles with eaach element called Tile.
/// It has two inializers, one is empty and another with sum and inventoryItems
@Observable class Board {
    /// tiles is a two dimentional array
    var tiles:[[Tile]]
    /// To check if the value of one element is a complete row or column
    var complete: Bool = false
    
    /// empty initializer
    init () {tiles = [[Tile]]()
    }
    
    /// second initializer with two elements
    /// sum is a value from calculatetotal func
    init(sum: Int, inventoryItems: [InventoryItem]) {
        tiles = [[Tile]]()
        var sum = calculateTotal(inventoryItems: inventoryItems)
        
        /// to fill my tiles array with label equal circle
        for _ in 1...sum {
            var tileRow = [Tile]()
            for _ in 1...sum {
                tileRow.append(Tile(item: "circle"))
            }
            tiles.append(tileRow)
        }
       
        /// logic to asign each image in a random position
        for item in inventoryItems {
            let label = item.label
            let rec = item.value
            
            if rec == sum {
                complete = true
            }
            
            if rec > 0 {
                /// Random for position
                var hor = Int.random(in: 0..<sum)
                var ver = Int.random(in: 0..<sum)
                /// Random for direction
                var dir = Int.random(in: 0..<2)
                
                /// Evaluate if the position selected is available otherwise change
                while tiles[hor][ver].item != "circle"{
                    hor = Int.random(in: 0..<sum)
                    ver = Int.random(in: 0..<sum)
                }
    
                if complete {
                    dir = 0
                    for x in 0..<sum {
                        tiles[hor][x] = Tile(item: label)
                    }
                }
                else
                {
                    let cell1 = hor + rec
                    let cell2 = ver + rec
                    if cell1 > sum{
                        hor = 0
                    }
                    if cell2 > sum{
                        ver = 0
                    }
                    for _ in 1...rec {
                        var temp = 0
                        
                        if dir == 0     // Horizontal
                        {
                            tiles[hor][ver] = Tile(item: label)
                            temp = hor
                            temp += 1
                            if temp >= sum {
                                hor -= 1
                            }else {
                                hor += 1
                            }
                        }
                        else        // vertical
                        {
                            tiles[hor][ver] = Tile(item: label)
                            temp = ver
                            temp += 1
                            if temp >= sum {
                                ver -= 1
                            }else {
                                ver += 1
                            }
                        }
                    }
                }
            }
        }
        //        for row in tiles {
        //            for tile in row {
        //                print(tile.item ?? "")
        //            }
        //        }
    }
}

/// Claculate the total of Tile to use
/// - Parameter inventoryItems: array with all the values
/// - Returns: return the sum of value of each element
func calculateTotal(inventoryItems: [InventoryItem]) -> Int {
    var sum: Int = 0
    for item in inventoryItems {
        sum += item.value
    }
    return sum
}

/// View to show every Tile represented as images with a default image, after clicked show the image into the Tile and finally, we have two label, one for the attempts clicked and the other the remaining of the elements find, also if this value is "0" the play is GemaOver
struct PlayView: View {
    @Query private var inventoryItems: [InventoryItem]
    @State private var sum = 0
    @State private var callBoard = Board()
    @State private var attempts: Int = 0
    @State private var remaining: Int = 0
    
    var body: some View {
        Grid {
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            ForEach(callBoard.tiles, id: \.self.first!) {
                row in
                GridRow {
                    ForEach(row) {
                        col in
                        Image(systemName: col.isReveled ? col.item.lowercased() : "wrongwaysign")
                            .resizable()
                            .scaledToFit()
                            .onTapGesture {
                                if !col.isReveled {
                                    col.isReveled = true
                                    attempts += 1
                                    if col.item != "circle"
                                    {
                                        remaining += 1
                                    }
                                }
                            }
                    }
                }
            }
            Text("Attempts: \(attempts)")
                .font(.system(size: 24))
            let tot = calculateTotal(inventoryItems: inventoryItems)
            let fin = finalText(remaining: remaining, tot: tot)
            Text(fin)
                .font(.system(size: 24))
        }
        .onAppear(perform: {
            attempts = 0
            remaining = 0
            callBoard = Board(sum: sum, inventoryItems: inventoryItems)
        })
    }
}

/// Return the final message for remaining called fin
/// - Parameters:
///   - remaining: this value content a counter if the images was reveled correctly
///   - tot: this value is the number of the total element to find
/// - Returns: Return Game over if all the elementes is founded and equal "0" otherwhise calculate the ramaining and send the value
func finalText(remaining: Int, tot: Int) -> String {
    var txt: String = ""
    if (tot - remaining) != 0
    {
        txt = "Total Remaining: \(tot - remaining)"
    }
    else
    {
        txt = "GAME OVER!"
    }
    return txt
}

#Preview {
    MainActor.assumeIsolated {
        ContentView().modelContainer(for: InventoryItem.self)
    }
}
