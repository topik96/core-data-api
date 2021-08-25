//
//  CoreDataStore+User.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//

import Foundation
import CoreData

extension CoreDataStore {
    func fetchUsers()-> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        do {
            let result = try context.fetch(request)
            return result
        }
        catch {
            return []
        }
    }
    
    func insertBulks(users: [UserResponse], completion: @escaping ([User])->Void?) {
        var storeData = [User]()
        context.performAndWait {
            for user in users {
                // User
                let entity = User(context: context)
                entity.id = user.id
                entity.name = user.name
                entity.email = user.email
                
                // Address
                let addressObject = Address(context: context)
                addressObject.street = user.address.street
                addressObject.city = user.address.city
                entity.address = addressObject
                
                // Geolocation
                let geoObject = Geolocation(context: context)
                geoObject.latitude = user.address.geo.lat
                geoObject.longitude = user.address.geo.lng
                entity.address?.geo = geoObject
                
                do {
                    try context.save()
                    storeData.append(entity)
                }
                catch {
                    completion([])
                    print("Error \(error.localizedDescription)")
                }
            }
        }
        
        if storeData.count == users.count {
            print("STORE DATA \(storeData.count)")
            completion(storeData)
        }
    }
}
