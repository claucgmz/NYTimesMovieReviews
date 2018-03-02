//
//  MovieReview.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/1/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieReview: Mappable {
  var title = ""
  var headline = ""
  var releaseDate = ""
  var imageURL = ""
  var summary = ""
  var articleURL = ""
  var articleText = ""
  var author = ""
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    title <- map["display_title"]
    headline <- map["headline"]
    releaseDate <- map ["opening_date"]
    imageURL <- map["multimedia.src"]
    articleURL <- map["link.url"]
    articleText <- map["link.suggested_link_text"]
    summary <- map["summary_short"]
    author <- map["byline"]
  }
}
