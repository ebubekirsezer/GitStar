//
//  Repository.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//


import Foundation
import RealmSwift

class Repository: BaseModel, Codable {

    @Persisted var nodes: List<Node> = List<Node>()
    @Persisted var pageInfo: PageInfo?
    @Persisted var totalCount: Int?


    enum CodingKeys: String, CodingKey {
        case nodes = "nodes"
        case pageInfo
        case totalCount = "totalCount"
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let nodesArray = try? container.decode([Node].self, forKey: .nodes)
        nodes.append(objectsIn: nodesArray ?? [])
        pageInfo = try? container.decode(PageInfo.self, forKey: .pageInfo)
        totalCount = try? container.decode(Int.self, forKey: .totalCount)
    }

}
