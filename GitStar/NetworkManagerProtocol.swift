//
//  NetworkManagerProtocol.swift
//  GitStar
//
//  Created by EbubekirSezer on 19.10.2022.
//

import Foundation
import Apollo

protocol NetworkManagerProtocol {
    var service: ApolloClient { get set }
    func queryGraphQLRequest<T: GraphQLQuery, K: Codable>(query: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void))
    func performGraphQLRequest<T: GraphQLMutation, K: Codable>(mutation: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void))
}
