//
//  NYTimesRouter.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/2/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import Alamofire

enum NYTimesRouter: URLRequestConvertible {

  case getDVDPicks(page: Int)
  
  var path: String {
    switch self {
    case .getDVDPicks:
      return APIManager.reviews
    }
  }
  
  var parameters: [String: Any] {
    switch self {
    case .getDVDPicks(let page):
      return ["offset": APIManager.resultsPerPage*page, "api-key": APIManager.key]
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getDVDPicks:
      return .get
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url = try APIManager.baseURL.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    
    print(urlRequest)
    urlRequest.httpMethod = method.rawValue
    return try URLEncoding.methodDependent.encode(urlRequest, with: parameters)
  }
}


