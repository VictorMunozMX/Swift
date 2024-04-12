//
//  RowView.swift
//  Lab1_2024
//
//  Created by IMD 224 on 2024-02-07.
//

import SwiftUI

struct RowView: View {
    var inventoryItem: InventoryItem
    var colour: Color
    
    var body: some View {
        HStack {
            Image(uiImage: inventoryItem.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .leading)
                .background(inventoryItem.favourite ? colour : Color(UIColor.systemBackground))
            Text(inventoryItem.details)
                .frame(width: 200, height: 100, alignment: .leading)
                .border(inventoryItem.favourite ? colour : Color(UIColor.systemBackground))
        }
        .padding()
    }
}

#Preview {
    MainView()
    //RowView(inventoryItem: InventoryItem(image: "hare", details: "Hare")
    //why?
}

