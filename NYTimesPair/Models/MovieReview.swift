//
//  MovieReview.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/1/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import ObjectMapper

struct MovieReview: Mappable {
  var title = ""
  var headline = ""
  var releaseDate = ""
  var imageURL: URL?
  var summary = ""
  var articleURL: URL?
  var articleText = ""
  var author = ""
  
  init?(map: Map) {
    
  }
  
  mutating func mapping(map: Map) {
    title       <- map["display_title"]
    headline    <- map["headline"]
    releaseDate <- map ["opening_date"]
    imageURL    <- (map["multimedia.src"], URLTransform())
    articleURL  <- (map["link.url"], URLTransform())
    articleText <- map["link.suggested_link_text"]
    summary     <- map["summary_short"]
    author      <- map["byline"]
  }
}
