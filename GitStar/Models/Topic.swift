//
//  Topic.swift
//  GitStar
//
//  Created by EbubekirSezer on 19.10.2022.
//

import Foundation

class Topic: Codable {

    var name: String?
    var repositories: Repository?

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
