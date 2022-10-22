//
//  RealmHelper.swift
//  GitStar
//
//  Created by EbubekirSezer on 22.10.2022.
//

import Foundation

class RealmHelper {
    
    static func DetachedCopy<T:Codable>(of object:T) -> T? {
        do {
            let json = try JSONEncoder().encode(object)
            return try JSONDecoder().decode(T.self, from: json)
        }
        catch let error {
            print(error)
            return nil
        }
    }
}
