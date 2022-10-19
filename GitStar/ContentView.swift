//
//  ContentView.swift
//  GitStar
//
//  Created by EbubekirSezer on 11.10.2022.
//

import SwiftUI
import Apollo

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .onAppear(perform: {
                NetworkManager.shared.queryGraphQLRequest(query: TopicQuery(name: "swiftui", first: 25), responseModel: Topic.self) { result in

                }
            })
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
