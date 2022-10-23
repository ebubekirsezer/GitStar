//
//  PageInfo.swift
//  GitStar
//
//  Created by EbubekirSezer on 23.10.2022.
//

import Foundation
import RealmSwift

class PageInfo: Object, ObjectKeyIdentifiable, Codable {

    @Persisted var endCursor: String?
    @Persisted var hasNextPage: Bool?


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
