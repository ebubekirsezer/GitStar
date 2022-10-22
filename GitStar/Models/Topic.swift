//
//  Topic.swift
//  GitStar
//
//  Created by EbubekirSezer on 19.10.2022.
//

import Foundation
import RealmSwift

class Topic: BaseModel, Codable {

    @Persisted var name: String?
    @Persisted var repositories: Repository?


    enum CodingKeys: String, CodingKey {
        case name = "name"
        case repositories
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        repositories = try? container.decode(Repository.self, forKey: .repositories)
    }

}

func createDummyTopic() -> Topic {
    let topic = Topic()
    topic.name = "SwiftUI"
    
    let owner = Owner()
    owner.url = "https://github.com/ebubekirsezer"
    owner.login = "ebubekirsezer"
    owner.avatarUrl = "https://avatars.githubusercontent.com/u/32433476?v=4"
        
    let node = Node()
    node.name = "GitStar"
    node.stargazerCount = 1
    node.forkCount = 1
    node.descriptionField = "This is a dummy"
    node.projectsUrl = "https://github.com/ebubekirsezer"
    node.url = "https://github.com/ebubekirsezer"
    node.id = "1"
    node.owner = owner
    
    let nodes = List<Node>()
    nodes.append(node)
    
    let repository = Repository()
    repository.totalCount = 1
    repository.nodes = nodes
    
    topic.repositories = repository
    return topic
}

