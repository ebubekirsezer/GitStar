//
//  ContentView.swift
//  GitStar
//
//  Created by EbubekirSezer on 11.10.2022.
//

import SwiftUI
import Apollo

struct ContentView: View {
    
    @State var isSplashShowed: Bool = false
    
    var body: some View {
        Group {
            if isSplashShowed {
                NavigationView {
                    AppTabView()
                }
                .accentColor(.primary)
            } else {
                SplashView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isSplashShowed = true
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
