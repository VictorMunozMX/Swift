//

import SwiftUI


// 18. Suma o resta y va acumulando el valor
//struct ContentView: View {
//    @State var textFieldValue = ""
//    @State var textValue = 0
//
//    var body: some View {
//        VStack {
//            TextField("Enter a Value", text: $textFieldValue)
//                .multilineTextAlignment(.center)
//            HStack {
//                ButtonView(label: "+", action: { left, right in left +
//                    right }, runningTotal: $textValue, newValue: textFieldValue)
//                ButtonView(label: "-", action: { left, right in left -
//                    right }, runningTotal: $textValue, newValue: textFieldValue)
//            }
//            Text(String(textValue))
//                .padding()
//        }
//    }
//}
//
//struct ButtonView: View {
//    var label: String
//    var action: (Int, Int) -> Int
//    @Binding var runningTotal: Int
//    var newValue: String
//
//    var body: some View {
//        Button(
//            label,
//            action: {
//                if let numValue = Int(self.newValue) {
//                    self.runningTotal = action(self.runningTotal, numValue)
//                }
//            }
//        )
//    }
//}


//19. Agrega un string ya sea al inicio o fin
//struct ContentView: View {
//    @State var textFieldValue = ""
//    @State var textValue = ""
//    var body: some View {
//        VStack {
//            TextField("Enter a Value", text: $textFieldValue)
//                .multilineTextAlignment(.center)
//            HStack {
//                ButtonView(label: "Insert at start", action: { left, right in
//                    right + left }, currentText: $textValue, newValue: textFieldValue)
//                ButtonView(label: "Append at end", action: { left, right in
//                    left + right }, currentText: $textValue, newValue: textFieldValue)
//            }
//            Text(textValue)
//                .padding()
//        }
//    }
//}
//
//struct ButtonView: View {
//    var label: String
//    var action: (String, String) -> String
//    @Binding var currentText: String
//    var newValue: String
//    var body: some View {
//        Button(
//            label,
//            action: {
//                if self.currentText.count + newValue.count < 20 {
//                    self.currentText = action(self.currentText, newValue)
//                }
//            }
//        )
//    }
//}

// 20. Busca en un string los numero 1,2,5,7,9
//struct ContentView: View {
//    @State var searchString = ""
//    @State var count = 0
//
//    var body: some View {
//        VStack {
//            TextField(
//                "Search String",
//                text: Binding(
//                    get: {
//                        searchString
//                    },
//                    set: {
//                        newValue in
//                        count = newValue.reduce(0) {
//                            switch $1 {
//                            case "1", "3", "5", "7", "9":
//                                return $0 + 1
//                            default:
//                                return $0
//                            }
//                        }
//                        searchString = newValue
//                    }
//                )
//            )
//            .multilineTextAlignment(.center)
//            Text(String(count))
//        }
//    }
//}

//21. Igual busca en una cadena los signos ".", ",", ":", ";", "!", "?" y te da el acumulado
//struct ContentView: View {
//    @State var searchString = ""
//    @State var count = 0
//
//    var body: some View {
//        VStack {
//            TextField(
//                "Search String",
//                text: Binding(
//                    get: {
//                        searchString
//                    },
//                    set: {
//                        newValue in
//                        count = newValue.reduce(0) {
//                            switch $1 {
//                            case ".", ",", ":", ";", "!", "?":
//                                return $0 + 1
//                            default:
//                                return $0
//                            }
//                        }
//                        searchString = newValue
//                    }))
//            .multilineTextAlignment(.center)
//            Text(String(count))
//        }
//    }
//}

//22. mismo caso, busca de la A a la Z e imcrementa counter, ojo mayusculas
//struct ContentView: View {
//    @State var searchString = ""
//    @State var count = 0
//
//    var body: some View {
//        VStack {
//            TextField(
//                "Search String",
//                text: Binding(
//                    get: {
//                        searchString
//                    },
//                    set: {
//                        newValue in
//                        count = newValue.reduce(0) {
//                            switch $1 {
//                            case "A"..."Z":
//                                return $0 + 1
//                            default:
//                                return $0
//                            }
//                        }
//                        searchString = newValue
//                    }
//                )
//            )
//            .multilineTextAlignment(.center)
//            Text(String(count))
//        }
//    }
//}

//23. A travez de binding realiza, si esta activado el toggle suma de 20 caso contrario 10 y muestra el valor
//struct ToggleView: View {
//    @Binding var isDoubling: Bool
//    var body: some View {
//        Toggle(isOn: $isDoubling) {
//            Text("Double")
//        }
//    }
//}
//struct ButtonView: View {
//    var isDoubling: Bool
//    @Binding var count: Int
//    var body: some View {
//        Button("+") {
//            self.count += isDoubling ? 20 : 10
//        }
//    }
//}
//struct TextView: View {
//    var count: Int
//    var body: some View {
//        Text(String(count))
//    }
//}
//struct ContentView: View {
//    @State var isDoubling = false
//    @State var count = 0
//    var body: some View {
//        VStack {
//            ToggleView(isDoubling: $isDoubling)
//            ButtonView(isDoubling: isDoubling, count: $count)
//            TextView(count: count)
//        }
//    }
//}

//24. Usa banding para habilitar el toggle y si es asi copia actualiza el contenido y lo copia a otro text, usando bindings
//struct ToggleView: View {
//    @Binding var isCopying: Bool
//    var body: some View {
//        Toggle(isOn: $isCopying) {
//            Text("Copy")
//        }
//    }
//}
//struct TextFieldView: View {
//    @State var textField: String = ""
//    var isCopying: Bool
//    @Binding var text: String
//    var body: some View {
//        TextField("Enter a String", text: Binding(
//            get: {
//                textField
//            },
//            set: {
//                newValue in
//                if isCopying {
//                    self.text = newValue
//                }
//                textField = newValue
//            }))
//    }
//}
//struct TextView: View {
//    var text: String
//    var body: some View {
//        Text(text)
//    }
//}
//struct ContentView: View {
//    @State var isCopying = false
//    @State var text = ""
//    var body: some View {
//        VStack {
//            ToggleView(isCopying: $isCopying)
//            TextFieldView(isCopying: isCopying, text: $text)
//            TextView(text: text)
//        }
//    }
//}

// show same image with one click
//@Observable class Tile: Identifiable {
//    let names = ["sun.max", "cloud.sun", "cloud", "cloud.rain"]
//
//    var name = "sun.max"
//    var index = 0
//
//    func click() {
//        index = (index + 1) % names.count
//        name = names[index]
//    }
//}
//
//struct ContentView: View {
//    @State private var tiles = [Tile(), Tile(), Tile(), Tile()]
//    var body: some View {
//        HStack {
//            ForEach(tiles) { t in
//                Button(action: { t.click() }) {
//                    Image(systemName: t.name)
//                                .resizable()
//                                .scaledToFit()
//                }
//            }
//        }
//        .padding()
//    }
//}

// diferent image in the bottom after clicked one show on the top
//struct ContentView: View {
//    var weather = ["sun.max", "cloud.sun", "cloud", "cloud.rain"]
//    @State private var currentImage = ""
//
//    var body: some View {
//        VStack {
//            Image(systemName: currentImage)
//                .resizable()
//                .scaledToFit()
//            Spacer()
//            HStack {
//                ForEach(weather, id: \.self) { str in
//                    Button(action: { currentImage = str }) {
//                        Image(systemName: str)
//                            .resizable()
//                            .scaledToFit()
//                    }
//                }
//            }
//        }
//        .padding()
//    }
//}

let collection = ["sun.max", "cloud.sun", "cloud", "cloud.rain"]
struct WeatherCondition: Hashable, Identifiable {
    let id = UUID()
    var label: String
}

struct ManageList: Hashable, Identifiable {
    let id = UUID()
    var label: String
}

struct ContentView: View {
    
    //  choose one of them, move another view, show a big image and delete
    //        @State private var weather = { () -> [WeatherCondition] in
    //            var result = [WeatherCondition]()
    //            for c in collection {
    //                result.append(WeatherCondition(label: c))
    //            }
    //            return result
    //        }()
    //
    //        var body: some View {
    //            NavigationStack{
    //                List(weather) { item in
    //                    NavigationLink(destination: Image(systemName: item.label)
    //                        .resizable(), label: {
    //                            Label(item.label, systemImage: item.label)
    //                        })
    //                    .swipeActions(edge: .trailing) {
    //                        Button(role: .destructive) {
    //                            weather.removeAll(where: { $0 == item}) // O(n)
    //                        } label: {
    //                            Label("Delete", systemImage: "trash")
    //                        }
    //                    }
    //                }
    //                .navigationTitle("Weather")
    //            }
    //            .padding()
    //        }
    
    // add many image and delete with buttom
    //    @State private var weather = [WeatherCondition]()
    //    var body: some View {
    //        NavigationStack{
    //            List {
    //                ForEach(weather) { item in
    //                    Label(item.label, systemImage: item.label)
    //                }
    //                .onDelete { // better than the removeAll approach
    //                    if let index = $0.first {
    //                        weather.remove(at: index)
    //                    }
    //                }
    //                .onMove {
    //                    weather.move(fromOffsets: $0, toOffset: $1)
    //                }
    //            }
    //            .navigationTitle("Weather")
    //            .toolbar {
    //                HStack {
    //                    EditButton()
    //                    Button(action: {
    //                        weather.insert(WeatherCondition(label:
    //                                                            collection.randomElement()!), at: 0)
    //                    }, label: {
    //                        Image(systemName: "plus")
    //                    })
    //                }
    //            }
    //        }
    //        .padding()
    //    }
    
    // add a cadena and after select a letter in the top show it
    //    var cadena: String = "H e l l o   V i c t o r"
    //    @State private var currentLetter = ""
    //
    //    var body: some View {
    //        VStack {
    //            Text(currentLetter)
    //            Spacer()
    //            HStack {
    //                ForEach(Array(cadena), id: \.self) { character in
    //                    Button(action:  { currentLetter = String(character) }) {
    //                        Text(String(character))
    //                    }
    //                }
    //            }
    //            .padding()
    //        }
    //    }
    
    
    var lista = ["Victor", "Juan", "Hugo", "Luis"]
    
    @State private var currentName = ""
    @State private var recursive = [ManageList]()
    
    var body: some View {
        VStack{
            Text(currentName)
            Spacer()
            ForEach(lista, id: \.self) { name in
                Text(name)
            }
        }
        
        Spacer()
        
        HStack {
            ForEach(lista, id: \.self) { name in
                Button(action:  { currentName = name }) {
                    Text(String(name))
                }
            }
        }
    }

    
}




