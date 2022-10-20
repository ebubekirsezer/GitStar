//
//  FavoritesRowItem.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import SwiftUI

struct FavoritesRowItem: View {
    
    var node: Node
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(node.name ?? "")
                
                Spacer()
                
                HStack {
                    HStack(spacing: 3) {
                        Image("fork")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        Text("\(node.forkCount ?? 0)")
                            .font(.caption)
                            .padding(4)
                    }
                    
                    HStack(spacing: 3) {
                        Image("star")
                            .resizable()
                            .foregroundColor(.black)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        Text("\(node.stargazerCount ?? 0)")
                            .font(.caption)
                            .padding(4)
                    }
                }
            }
            
            Text("by \(node.owner?.login ?? "")")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.cardBackgroundColor)
        )
    }
}

struct FavoritesRowItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesRowItem(node: createDummyTopic().repositories?.nodes.first ?? Node())
    }
}
