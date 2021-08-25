//
//  RouteRequest.swift
//
//  Created by Topik Mujianto on 20/08/21.
//

import Alamofire

enum RouteRequest: URLRequestConvertible {
  static let baseURLString = NetworkConfig.baseURL
  
  case doGetUserList
  
  var method: HTTPMethod {
    return .get
  }
  
  var res: (path: String, param: [String: Any]) {
    switch self {
    case .doGetUserList:
        return (Endpoint.USERS, [:])
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    var url: URL?
    var urlRequest: URLRequest?
    url = try RouteRequest.baseURLString.asURL()
    urlRequest = URLRequest(url: (url?.appendingPathComponent(res.path))!)
    urlRequest?.httpMethod = method.rawValue
    urlRequest = try URLEncoding.default.encode(urlRequest!, with: res.param)
    return urlRequest!
  }
  
}
