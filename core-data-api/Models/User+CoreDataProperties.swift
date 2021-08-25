//
//  User+CoreDataProperties.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String
    @NSManaged public var id: Int32
    @NSManaged public var name: String
    @NSManaged public var address: Address?

}

extension User : Identifiable {

}
