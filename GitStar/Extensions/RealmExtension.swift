//
//  RealmExtension.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import Foundation
import Realm
import RealmSwift

private let kMinimumDataVersionKey: String = "kMinimumDataVersionKey"
private let kRealmDataVersion: UInt64 = 1    // If any change happen in the Realm DB, increase the parameter by 1
private let kMinimumDataVersion: Int = 1    // If you want to delete all the data increase the parameter by 1
private let kRealmIDKey: String = "realmID"

extension Realm {
    static func migrate() {

        let config = Realm.Configuration(schemaVersion: kRealmDataVersion) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: Topic.className()) { (_, newObject) in
                    newObject?[kRealmIDKey] = UUID().uuidString // In the migration, we are changing the realmID
                }
            }
        }

        Realm.Configuration.defaultConfiguration = config

        do {
            _ = try Realm()
            print(config.fileURL ?? "")
        } catch let error as NSError {
            print(error)
        }

        let minimumDataVersion = kMinimumDataVersion
        let currentDataVersion = UserDefaults.standard.integer(forKey: kMinimumDataVersionKey)
        let deleteContent: Bool = currentDataVersion < minimumDataVersion

        if deleteContent {
            RealmManager.deleteAllRealmFiles()
            UserDefaults.standard.set(minimumDataVersion, forKey: kMinimumDataVersionKey)
            UserDefaults.standard.synchronize()
        }

    }
}
