import SwiftUI

/// A single settings row.
struct RowView: View {
    /// An individual treasure.
    @Bindable var treasure: Treasure
    
    var maxAllowed: Int
    
    @State private var board = Board()
    
    var body: some View {
        HStack {
            TextField("Treasure Name", text: $treasure.name)
            //.autocapitalization(.none)
                .padding()
            
            Spacer()
            
            Text("\(treasure.clusterSize)")
                .lineLimit(1)
            
            //            Stepper("Cluster Size", value: $treasure.clusterSize, in: minClusterSize...maxClusterSize, step: 1)
            //                .labelsHidden()
            //                .padding()
            
            #if os(watchOS)
                Stepper("Cluster Size", value: $treasure.clusterSize, in: minClusterSize...maxAllowed, step: 1)
                .labelsHidden()
                .padding()

            #else
                Stepper("Cluster Size", value: $treasure.clusterSize, in: minClusterSize...maxClusterSize, step: 1) // Asegúrate de que el rango también tiene un máximo de 4
                .labelsHidden()
                .padding()
            #endif
        }
    }
}

func totNum (treasure: [Treasure]) -> Int {
    var sum: Int = 0
    for item in treasure {
        sum += item.clusterSize
    }
    return sum
}

#Preview {
    MainActor.assumeIsolated {
        ContentView()
            .modelContainer(for: Treasure.self)
    }
}

