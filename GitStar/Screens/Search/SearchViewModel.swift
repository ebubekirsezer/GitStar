//
//  SearchViewModel.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var topic: Topic?
    @Published var isLoading: Bool = false
    @Published var isHaveError: Bool = false
    
    func search() {
        isLoading = true
        NetworkManager.shared.queryGraphQLRequest(query: TopicQuery(name: searchText.lowercased(),
                                                                    first: 25),
                                                  responseModel: Topic.self) { result in
            switch result {
            case .success(let topic):
                self.topic = topic
                self.isLoading = false
            case .failure(_):
                self.isHaveError = true
                self.isLoading = false
            }
        }
    }
}
