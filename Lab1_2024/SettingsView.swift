//
//  SettingsView.swift
//  Lab1_2024
//
//  Created by IMD 224 on 2024-01-26.
//

import SwiftUI

struct SettingsView: View {
    @Binding var colour: Color
    @Binding var value: Int
    let step = 10
    let min  = 10
    let max  = 100
    
    var body: some View {
        VStack
        {
            //ColorPicker("Background", selection: $colour).padding()
            ColorPicker("backColour", selection: Binding (
                get: {colour},
                set: {
                    new in 
                    colour = new
                    UserDefaults.standard.set(color2array(colour: colour), forKey: "backColour")
                    
                }
            )
            ).padding()
             .accessibilityIdentifier("BackgroundColorPicker")
            
            //Stepper(value: $value, in: min...max, step: step) {
            //Text("Max Character Count:  \(value)")
            //}.padding()
            
            Stepper(value: Binding (
                get: {value},
                set: {
                    new in
                    value = new
                    UserDefaults.standard.set(value, forKey: "maxCharacter")
                    }
                ), in: min...max, step: step)
            {
                Text("Max Character Count:  \(value)")
            }.padding()
                .accessibilityIdentifier("MaxCountStepper")
        }
    }
}

func color2array(colour: Color) -> [CGFloat] {
    let uiColor = UIColor(colour)
    var red: CGFloat   = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat  = 0.0
    var alpha: CGFloat = 0.0
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return [red,green,blue,alpha]
}

func array2color(array: [CGFloat]) -> Color {
    return Color(Color.RGBColorSpace.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])
}

#Preview {
    MainView()
}
