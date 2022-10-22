//
//  DetailViewModel.swift
//  GitStar
//
//  Created by EbubekirSezer on 21.10.2022.
//

import Foundation

final class DetaiViewModel: ObservableObject {
    
    @Published var isAdded: Bool = false
    
    func control(node: Node) {
        guard let nodeID = node.id else { return }
        if let _ = RealmManager.service.get(type: Node.self)?.filter("id = %@", nodeID).first {
            isAdded = true
            return
        }
        isAdded = false
    }
    
    func addOrRemove(node: Node) {
        let copyNode = RealmHelper.DetachedCopy(of: node)
        guard let nodeID = copyNode?.id else { return }
        if let dbNode = RealmManager.service.get(type: Node.self)?.filter("id = %@", nodeID).first {
            RealmManager.service.delete(object: dbNode)
            isAdded = false
        } else {
            RealmManager.service.add(object: copyNode)
            isAdded = true
        }
    }
}
