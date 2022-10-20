//
//  AppTabView.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        
            TabView {
                
                NavigationView {
                    SearchView()
                        .background(Color.backgroundColor)
                }
                .tabItem {
                    Label("Home", systemImage: "magnifyingglass")
                }
                
                NavigationView {
                    FavoritesView()
                        .background(Color.backgroundColor)
                }
                .tabItem {
                    Label("Favorites", systemImage: "suit.heart.fill")
                }
            }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
