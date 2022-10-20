//
//  AlertView.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct AlertView: View {
    
    @Binding var isPresented: Bool
    var title: String
    var message: String
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()

                VStack(spacing: 16) {

                    VStack(spacing: 3) {
                        Text(title)
                            .font(.title2)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text(message)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    Button {
                        isPresented = false
                    } label: {
                        Text("OK")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 54)
                    .frame(maxWidth: .infinity)
                    .background(Color.backgroundColor)
                    .mask(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                    )
                }
                .frame(width: 340)
                .padding(20)
                .background(Color.cardBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))

                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .opacity(isPresented ? 1 : 0)
        .ignoresSafeArea()
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(isPresented: .constant(true),
                  title: "Error",
                  message: "Something went wrong")
    }
}
