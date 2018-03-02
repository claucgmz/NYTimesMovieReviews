//
//  NYTimesServices.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/1/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class NYTimesServices {
  func getDVDPicks(onSuccess: @escaping([MovieReview]) -> Void, onFailure: @escaping() -> Void) {
    let dvdPicksURL = "\(APIManager.baseURL)/reviews/dvd-picks.json?offset=0&api-key=\(APIManager.key)"
    Alamofire.request(dvdPicksURL).validate().responseObject { (response: DataResponse<MovieReviewResponse>) in
      let reviews = response.result.value
      if let movieReviews = reviews?.reviews {
        for review in movieReviews {
          print(review.title)
          print(review.summary)
        }
        onSuccess(movieReviews)
      }
    }
  }
}
