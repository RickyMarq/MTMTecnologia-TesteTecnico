//
//  Color+Extension.swift
//  MTMTWatch Watch App
//
//  Created by Henrique Marques on 05/08/23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        let hexValue = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        
        Scanner(string: hexValue).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
