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
    @Published var nodes: [Node] = []
    @Published var isLoading: Bool = false
    @Published var isHaveError: Bool = false
    
    func search(after: String? = nil) {
        isLoading = true
        NetworkManager.shared.queryGraphQLRequest(query: TopicQuery(name: searchText.lowercased(),
                                                                    first: 100,
                                                                    after: after),
                                                  responseModel: Topic.self) { result in
            switch result {
            case .success(let topic):
                self.topic = topic
                self.nodes.append(contentsOf: topic.repositories?.nodes ?? [])
                self.isLoading = false
            case .failure(_):
                self.isHaveError = true
                self.isLoading = false
            }
        }
    }
    
    func loadContent(with node: Node) {
        let thresholdIndex = nodes.index(nodes.endIndex, offsetBy: -1)
        let finalNode = nodes[thresholdIndex]
        if finalNode.id == node.id {
            search(after: topic?.repositories?.pageInfo?.endCursor)
        }
    }
}
