//
//  AlertModifier.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct GSAlertModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    var title: String
    var message: String
    
    func body(content: Content) -> some View {
        content
            .disabled(isPresented)
            .blur(radius: isPresented ? 3 : 0)
            .overlay(
                AlertView(isPresented: $isPresented,
                          title: title,
                          message: message)
            )
    }
}

extension View {
    
    func showAlert(_ isPresented: Binding<Bool>, title: String = "Error", message: String = "Something went wrong :(") -> some View {
        modifier(GSAlertModifier(isPresented: isPresented, title: title, message: message))
    }
}
