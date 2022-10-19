//
//  NetworkInterceptorProvider.swift
//  GitStar
//
//  Created by EbubekirSezer on 19.10.2022.
//

import Foundation
import Apollo

struct NetworkInterceptorProvider: InterceptorProvider {

  private let store: ApolloStore
  private let client: URLSessionClient

    init(store: ApolloStore,
         client: URLSessionClient) {
    self.store = store
    self.client = client
  }

  func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
    return [
      CacheReadInterceptor(store: self.store),
      TokenInterceptor(token: Constants.GITHUB_TOKEN),
      NetworkFetchInterceptor(client: self.client),
      ResponseCodeInterceptor(),
      JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
      AutomaticPersistedQueryInterceptor(),
      CacheWriteInterceptor(store: self.store)
    ]
  }
}
