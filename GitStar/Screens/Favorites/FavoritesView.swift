//
//  FavoritesView.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import SwiftUI
import RealmSwift

struct FavoritesView: View {
    
    @ObservedResults(Node.self) var nodes
    
    var body: some View {
        ScrollView {
            ForEach(nodes.arrayValue(), id: \.id) { node in
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
