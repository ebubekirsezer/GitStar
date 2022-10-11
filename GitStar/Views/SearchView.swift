//
//  SearchView.swift
//  GitStar
//
//  Created by EbubekirSezer on 11.10.2022.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    
    var body: some View {
        VStack {
            Text("Hello Git Star")
        }
        .navigationTitle("GitStar ⭐️")
        .searchable(text: $searchText)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
