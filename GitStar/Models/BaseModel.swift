//
//  BaseModel.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import Foundation
import RealmSwift

class BaseModel: Object, ObjectKeyIdentifiable {
    @Persisted var realmID: String = UUID().uuidString
    @Persisted var deleted: Bool = false

    static func allObjects<T>(in realm: Realm?) -> Results<T>? where T: BaseModel {
        guard let realm = realm else { return nil }
        guard !(realm.isInWriteTransaction) else { return nil }
        let predicate = NSPredicate(format: "%K = 0", "deleted")
        return realm.objects(T.self).filter(predicate)
    }
    
    func markSelfAsDeleted() {
        self.deleted = true
    }
    
    func markSelfAsNotDeleted() {
        self.deleted = false
    }
}
