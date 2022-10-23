//
//  PageInfo.swift
//  GitStar
//
//  Created by EbubekirSezer on 22.10.2022.
//

import Foundation

class PageInfo: Codable {

    var endCursor: String?
    var hasNextPage: Bool?


    enum CodingKeys: String, CodingKey {
        case endCursor = "endCursor"
        case hasNextPage = "hasNextPage"
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        endCursor = try? container.decode(String.self, forKey: .endCursor)
        hasNextPage = try? container.decode(Bool.self, forKey: .hasNextPage)
    }

}
