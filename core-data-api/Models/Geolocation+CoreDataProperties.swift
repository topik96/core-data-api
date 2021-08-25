//
//  Geolocation+CoreDataProperties.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//
//

import Foundation
import CoreData


extension Geolocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Geolocation> {
        return NSFetchRequest<Geolocation>(entityName: "Geolocation")
    }

    @NSManaged public var latitude: String
    @NSManaged public var longitude: String
    @NSManaged public var fullAddress: Address?

}

extension Geolocation : Identifiable {

}
