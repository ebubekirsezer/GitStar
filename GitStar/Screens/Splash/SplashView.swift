//
//  SplashView.swift
//  GitStar
//
//  Created by EbubekirSezer on 23.10.2022.
//

import SwiftUI

struct SplashView: View {
    
    @State var appear: [Bool] = [false]
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                Image("git")
                
                Image("star-logo")
                    .opacity(appear[0] ? 1 : 0)
                    .offset(y: appear[0] ? 0 : 20)
            }
        }
        .onAppear(perform: {
            withAnimation(.spring().delay(0.2)) {
                appear[0] = true
            }
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
