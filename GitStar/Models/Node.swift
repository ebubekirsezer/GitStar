//
//  Node.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import Foundation

class Node: Codable {
    
    var descriptionField: String?
    var forkCount: Int?
    var id: String?
    var name: String?
    var owner: Owner?
    var projectsUrl: String?
    var stargazerCount: Int?
    var url: String?
    
    
    enum CodingKeys: String, CodingKey {
        case descriptionField = "description"
        case forkCount = "forkCount"
        case id = "id"
        case name = "name"
        case owner
        case projectsUrl = "projectsUrl"
        case stargazerCount = "stargazerCount"
        case url = "url"
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        descriptionField = try? container.decode(String.self, forKey: .descriptionField)
        forkCount = try? container.decode(Int.self, forKey: .forkCount)
        id = try? container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        owner = try? container.decode(Owner.self, forKey: .owner)
        projectsUrl = try? container.decode(String.self, forKey: .projectsUrl)
        stargazerCount = try? container.decode(Int.self, forKey: .stargazerCount)
        url = try? container.decode(String.self, forKey: .url)
    }
    
}
