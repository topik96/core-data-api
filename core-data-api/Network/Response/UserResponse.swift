//
//  DAOUser.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//

import Foundation

// MARK: - User
struct UserResponse: Decodable {
    let id: Int32
    let name, username, email: String
    let address: AddressResponse
    let phone, website: String
}

// MARK: - Address
struct AddressResponse: Decodable {
    let street, suite, city, zipcode: String
    let geo: GeoResponse
}

// MARK: - Geo
struct GeoResponse: Decodable {
    let lat, lng: String
}
