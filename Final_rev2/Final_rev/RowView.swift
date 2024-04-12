//
//  RowView.swift
//  Final_rev
//
//  Created by IMD 224 on 2024-04-12.
//

import SwiftUI

struct RowView: View {
    
    @Bindable var inventoryItems: InventoryItem
    
    var body: some View {
        HStack {
            
            TextField("", text: $inventoryItems.name)
                .font(.system(size: 24))
            
            Stepper(value: $inventoryItems.cantidad, in: 1...10)
            {
                Text(String(inventoryItems.cantidad))
                    .font(.system(size: 24))
                    .foregroundStyle(.red)
            }
        }
        .padding()
    }
}

//#Preview {
//    MainActor.assumeIsolated {
//        MainView().modelContainer(for: InventoryItem.self)
//    }
//}
