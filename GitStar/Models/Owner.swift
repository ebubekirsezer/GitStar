//
//  Owner.swift
//  GitStar
//
//  Created by EbubekirSezer on 20.10.2022.
//

import Foundation
import RealmSwift

class Owner: BaseModel, Codable {

    @Persisted var avatarUrl: String?
    @Persisted var login: String?
    @Persisted var url: String?


    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatarUrl"
        case login = "login"
        case url = "url"
    }

    required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        avatarUrl = try? container.decode(String.self, forKey: .avatarUrl)
        login = try? container.decode(String.self, forKey: .login)
        url = try? container.decode(String.self, forKey: .url)
    }

}
