//
//  AvatarImageView.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct AvatarImageView: View {
    var imageURL: String
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        } placeholder: {
            Image("avatar-placeholder")
                .resizable()
        }
    }
}

struct AvatarImageView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarImageView(imageURL: "https://avatars.githubusercontent.com/u/33113626?v=4")
    }
}
