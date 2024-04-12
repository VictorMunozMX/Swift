//
//  InventoryItem.swift
//  Lab1_2024
//
//  Created by IMD 224 on 2024-02-07.
//
import UIKit
import Foundation
//import Observation
import SwiftData

@Model class InventoryItem: Identifiable {	
    //var image = ""
    var image: UIImage {
        get {
            UIImage(data: self.imageAsData) ?? UIImage(systemName: "questionmark")!
        }
        set {
            self.imageAsData = newValue.pngData() ?? UIImage(systemName: "questionmark")!.pngData()!
        }
    }
    var imageAsData: Data
    var details = ""
    var favourite = false
    
    init(image: String, details: String) {
        //self.image = image
        self.imageAsData = (UIImage(systemName: image) ?? UIImage(systemName: "questionmark")!).pngData()!
        self.details = details
        self.favourite = false
    }
    
    init(image: UIImage, details: String)
    {
        self.imageAsData = image.pngData() ?? Data()
        self.details = details
        self.favourite = false
    }
    
}

