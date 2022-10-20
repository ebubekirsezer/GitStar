//
//  SearchView.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel = .init()
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 6), count: 2)
    
    var body: some View {
        
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.topic?.repositories?.nodes ?? [], id: \.id) { repository in
                        RepositoryRowItem(node: repository)
                    }
                }
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("GitStar ⭐️")
        .searchable(text: $viewModel.searchText)
        .showLoading($viewModel.isLoading)
        .showAlert($viewModel.isHaveError)
        .onSubmit(of: .search) {
            viewModel.search()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
