//
//  MovieReviewResponse.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/2/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieReviewResponse: Mappable {
  var reviews: [MovieReview]?
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    reviews <- map["results"]
  }
}


