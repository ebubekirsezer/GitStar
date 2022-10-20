//
//  LoadingModifier.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct GSLoadingModifier: ViewModifier {
    
    @Binding var isShow: Bool
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
                .disabled(isShow)
                .blur(radius: isShow ? 3 : 0)
            
            ProgressView()
                .progressViewStyle(.circular)
                .opacity(isShow ? 1 : 0)
            
        }
    }
}

extension View {
    
    func showLoading(_ isShow: Binding<Bool>) -> some View {
        modifier(GSLoadingModifier(isShow: isShow))
    }
}
