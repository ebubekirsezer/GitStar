//
//  FavoritesView.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        ScrollView {
            ForEach(createDummyTopic().repositories?.nodes ?? [], id: \.id) { node in
                Link(destination: URL(string: node.url ?? "")!) {
                    FavoritesRowItem(node: node)
                }
            }
        }
        .background(Color.clear)
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
