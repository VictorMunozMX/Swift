//
//  ContentView.swift
//  Midterm1
//
//  Created by IMD 224 on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    @State var textField: String = ""
    @State var text: String
    @State var isCopying: Bool = false
    
    var body: some View {
        TextEditor(text: textField)
        
        Toggle(isOn: Binding (
            get: {textField},
            set: {
                newValue in
                if isCopying {
                    text = ""
                }
                textField = newValue
                }
            )
        }
}


#Preview {
    ContentView()
}
