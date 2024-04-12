//
//  ContentView.swift
//  Lab1_2024
//
//  Created by IMD 224 on 2024-01-24.
//

import SwiftUI
import Photos

struct DetailView: View {
    
    //@State private var favourite = false
    var colour: Color
    var value: Int
    // @State private var details : String
    // L4
    //@Binding var inventoryItem: InventoryItem
    @State var inventoryItem: InventoryItem
    //L6
    @State private var pickerVisible = false
    @State private var showCameraAlert = false
    @State private var imageSource = UIImagePickerController.SourceType.camera
    @State private var showLibraryAlert = false
    
    
    var body: some View {
        ZStack {
            VStack {
                //Image(systemName: "pencil")
                Image(uiImage: inventoryItem.image)
                    .resizable(resizingMode: .stretch)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .background(inventoryItem.favourite ? colour : Color(UIColor.systemBackground))
                    .accessibilityIdentifier("DetailImage")
                    .scaledToFit()
                    .gesture(TapGesture(count: 1).onEnded({ value in
                        PHPhotoLibrary.requestAuthorization({ status in
                            if status == .authorized {
                                self.showLibraryAlert = false
                                self.imageSource = UIImagePickerController.SourceType.photoLibrary
                                self.pickerVisible.toggle()
                            } else {
                                self.showLibraryAlert = true
                            }
                        })
                    }))
                    .border(inventoryItem.favourite ? colour : Color(UIColor.systemBackground))
                Toggle(isOn:
                        Binding(
                            get: {
                                inventoryItem.favourite
                            },
                            set: {
                                new in
                                inventoryItem.favourite = new
                            }))
                {
                    Text("Favourite")
                }
                .accessibilityIdentifier("FavoutireToggle")
                TextEditor(text:
                            Binding(
                                get: {
                                    inventoryItem.details
                                },
                                set: {
                                    newValue in
                                    if newValue.count <= value {
                                        inventoryItem.details = newValue
                                    }
                                }
                            )
                )
                .accessibilityIdentifier("DetailTextEditor")
                Text(String(inventoryItem.details.count) + "/" + String(value)).accessibilityIdentifier("DetailText")
            }
            if pickerVisible {
                ImageView(
                    pickerVisible: $pickerVisible,
                    sourceType: $imageSource,
                    action: {
                        (value) in
                        if let image = value {
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                                self.inventoryItem.image = image
                            }
                        }
                    }
                )
            }
        }
        .padding()
        .toolbar {
            ToolbarItemGroup {
                Button(
                    action: {
                        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                            if response &&
                                UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                                self.showCameraAlert = false
                                self.imageSource = UIImagePickerController.SourceType.camera
                                self.pickerVisible.toggle()
                            } else {
                                self.showCameraAlert = true
                            }
                        }
                    },
                    label: {
                        Image(systemName: "camera")
                    }
                )
            }
        }
        .alert(isPresented: $showCameraAlert) {
            Alert(title: Text("Error"), message: Text("Camera not available"), dismissButton: .default(Text("OK")))
        }
    }
}


#Preview {
    MainView()
}



