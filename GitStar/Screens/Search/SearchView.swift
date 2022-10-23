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
            if viewModel.topic == nil {
                VStack(spacing: 16) {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    Text("Lets start searching 🔎")
                }
                .frame(maxHeight: .infinity, alignment: .center)
            } else if viewModel.topic?.repositories?.totalCount == 0 {
                Text("Nothing found 🫤")
                    .frame(maxHeight: .infinity, alignment: .center)
            } else {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.nodes, id: \.id) { node in
                            
                            NavigationLink(destination: DetailView(node: node)) {
                                RepositoryRowItem(node: node)
                                    .onAppear {
                                        viewModel.loadContent(with: node)
                                    }
                            }
                            .foregroundColor(.primary)
                        }
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
