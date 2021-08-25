//
//  BaseDAO.swift
//  core-data-api
//
//  Created by GMV on 24/08/21.
//

import Foundation

struct BaseResponse<T>: Decodable {
    var user: UserResponse
    
    enum CodingKeys: String, CodingKey {
        case user
    }
}
