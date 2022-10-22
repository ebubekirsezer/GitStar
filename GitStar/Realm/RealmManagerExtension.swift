//
//  RealmManagerExtension.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import Foundation
import RealmSwift

extension RealmManager {
    
    // MARK: GET
    func get<T: BaseModel>(type: T.Type, in path: RealmFileType = .Default) -> Results<T>? {
        return type.allObjects(in: RealmManager.service.realm(named: path.rawValue))
    }
    
    // MARK: ADD
    func add(object: BaseModel?, in path: RealmFileType = .Default) {
        guard let object = object else { return }
        self.add(objects: [object], in: path)
    }
    
    func add<T: Collection>(objects: T?, in path: RealmFileType = .Default) where T.Element: BaseModel {
        guard let realm = self.realm(named: path.rawValue) else { return }
        guard let objects = objects else { return }
        
        do {
            try? realm.write({
                realm.add(objects)
            })
        }
    }
    
    // MARK: DELETE
    func delete<T: BaseModel>(object: T?, in path: RealmFileType = .Default) {
        
        guard let object = object else { return }
        self.delete([object], in: path)
    }
    
    func delete<T: Collection>(_ objects: T?, in path: RealmFileType = .Default) where T.Element: BaseModel {
        guard let realm = self.realm(named: path.rawValue) else { return }
        guard let objects = objects else { return }
        
        do {
            try? realm.write({
                realm.delete(objects, cascading: true)
            })
        }
    }
    
    func deleteAllObjects(in path: RealmFileType = .Default) {
        let realm = self.realm(named: path.rawValue)
        
        do {
            try? realm?.write({
                realm?.deleteAll()
            })
        }
    }
}
