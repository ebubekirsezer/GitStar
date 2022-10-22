//
//  RealmExtension.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import Foundation

extension Collection {
    
    func arrayValue<T>() -> [T] where Self.Element == T {

        guard self.count > 0 else { return [] }
        var list: [T] = []
        list.append(contentsOf: self)

        return list
    }
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
