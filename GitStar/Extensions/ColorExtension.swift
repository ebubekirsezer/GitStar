//
//  ColorExtension.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

extension Color {
    static var backgroundColor: Color {
        RGB(red: 13, green: 17, blue: 23)
    }
    
    static var cardBackgroundColor: Color {
        RGB(red: 22, green: 27, blue: 34)
    }
    
    static var githubGrayColor: Color {
        RGB(red: 128, green: 134, blue: 143)
    }
    
    static var circleBGColor: Color {
        RGB(red: 49, green: 54, blue: 60)
    }
}

func RGB(red: Double, green: Double, blue: Double) -> Color {
    Color(red: red / 255, green: green / 255, blue: blue / 255)
}
