//
//  Address+CoreDataProperties.swift
//  core-data-api
//
//  Created by Topik Mujianto on 24/08/21.
//
//

import Foundation
import CoreData


extension Address {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Address> {
        return NSFetchRequest<Address>(entityName: "Address")
    }

    @NSManaged public var city: String
    @NSManaged public var street: String
    @NSManaged public var geo: Geolocation?
    @NSManaged public var user: User?

}

extension Address : Identifiable {

}
