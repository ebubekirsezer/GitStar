//
//  NetworkManager.swift
//  GitStar
//
//  Created by EbubekirSezer on 19.10.2022.
//

import Foundation
import Apollo

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared: NetworkManager = .init()
    
    private lazy var _service: ApolloClient = {
        let store = ApolloStore()
        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: "https://api.github.com/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
    
    var service: ApolloClient {
        get { return _service }
        set { _service = newValue }
    }
    
    func queryGraphQLRequest<T, K>(query: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLQuery, K : Decodable, K : Encodable {
        
        let operationName = query.operationName
        NetworkManager.shared.service.fetch(query: query) { result in
            
            switch result {
            case .success(let apolloResponse):
                if let dictionary = apolloResponse.data?.resultMap[operationName.lowercased()],
                   let dict = dictionary {
                    if let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) {
                        do {
                             guard let jsonResults = try? JSONDecoder().decode(responseModel, from: jsonData) else {
                                 completion(.failure(NSError()))
                                 return
                             }
                             completion(.success(jsonResults))
                        }
                    } else {
                        completion(.failure(NSError()))
                    }
                } else {
                    completion(.failure(NSError()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func performGraphQLRequest<T, K>(mutation: T, responseModel: K.Type, completion: @escaping ((Result<K, Error>) -> Void)) where T : Apollo.GraphQLMutation, K : Decodable, K : Encodable {
        
        let operationName = mutation.operationName
        NetworkManager.shared.service.perform(mutation: mutation) { result in
        
            switch result {
            case .success(let apolloResponse):
                if let dictionary = apolloResponse.data?.jsonObject[operationName.lowercased()] {
                    if let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted) {
                        do {
                             let jsonResults = try JSONDecoder().decode(responseModel, from: jsonData)
                             completion(.success(jsonResults))
                        } catch {
                            print("Parse:\(error)")
                        }
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
