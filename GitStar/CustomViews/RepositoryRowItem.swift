//
//  RepositoryRowItem.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct RepositoryRowItem: View {
    
    var node: Node
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(node.name ?? "")
                .font(.title3)
            
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
                
                Spacer()
            }
            
            HStack {
                AvatarImageView(imageURL: node.owner?.avatarUrl ?? "")
                    .frame(width: 40, height: 40)
                
                Text("\(node.owner?.login ?? "")")
                    .font(.body)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical)
        .padding(.leading)
        .padding(.trailing, 4)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.cardBackgroundColor)
        )
    }
}

struct RepositoryRowItem_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryRowItem(node: Node())
            .previewLayout(.sizeThatFits)
    }
}
