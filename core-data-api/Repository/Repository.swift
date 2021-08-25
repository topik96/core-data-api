//
//  Repository.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//

import Foundation

struct Repository {
    static func doGetUserList(onSuccess: @escaping ([User])->Void) {
        let dbUsers = CoreDataStore.shared.fetchUsers()
        if dbUsers.count > 0 { onSuccess(dbUsers); return }
        BaseRequest.request(from: RouteRequest.doGetUserList, onSuccess: { (res: [UserResponse]) in
            CoreDataStore.shared.insertBulks(users: res) { users in
                onSuccess(users)
            }
        }) { (message, code) in
            print("ERROR \(message)")
        }
    }
}
