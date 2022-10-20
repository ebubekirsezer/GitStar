//
//  Repository.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import Foundation

class Repository: Codable {

    var nodes: [Node] = []
    var totalCount: Int?


    enum CodingKeys: String, CodingKey {
        case nodes = "nodes"
        case totalCount = "totalCount"
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let nodesArray = try? container.decode([Node].self, forKey: .nodes)
        nodes = nodesArray ?? []
        totalCount = try? container.decode(Int.self, forKey: .totalCount)
    }
}
