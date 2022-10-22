//
//  RealmManager.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import Foundation
import Realm
import RealmSwift

class RealmManager {
    
    // REALM SERVICE
    static let service: RealmManager = RealmManager.init()
    
    static func deleteAllRealmFiles() {
        
        let base: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
        
        func removeFileAt(path: RealmFileType) {
            try? FileManager.default.removeItem(at: base.appendingPathComponent(path.rawValue))
        }
        
        for path in RealmFileType.allCases {
            removeFileAt(path: path)
        }
    }
    
    func realm(named: String) -> Realm? {
        
        var config = Realm.Configuration.defaultConfiguration
        
        guard let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last?.appendingPathComponent(named + ".realm") else {
            return self.realm(named: named)
        }
        config.fileURL = fileUrl
        
        do {
            return try Realm(configuration: config, queue: nil)
        } catch {
            print("RealmError:\(error.localizedDescription)")
            return self.realm(named: named)
        }
    }
    
    func realmConfiguration(for path: RealmFileType = .Default) -> Realm.Configuration {
        var config = Realm.Configuration.defaultConfiguration
        
        guard let fileUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last?.appendingPathComponent(path.rawValue + ".realm") else {
            return config
        }
        config.fileURL = fileUrl
        return config
    }
    
    func migrate() {
        Realm.migrate()
    }
}
