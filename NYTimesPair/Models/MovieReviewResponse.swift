//
//  MovieReviewResponse.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/2/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieReviewResponse: Mappable {
  var reviews: [MovieReview]?
  
  required init?(map: Map) {
  }
  
  func mapping(map: Map) {
    reviews <- map["results"]
  }
}


