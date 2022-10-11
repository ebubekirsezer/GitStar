//
//  ColorExtension.swift
//  GitStar
//
//  Created by EbubekirSezer on 11.10.2022.
//

import SwiftUI

extension Color {
    static var backgroundColor: Color {
        RGB(red: 13, green: 17, blue: 23)
    }
}

func RGB(red: Double, green: Double, blue: Double) -> Color {
    Color(red: red / 255, green: green / 255, blue: blue / 255)
}
