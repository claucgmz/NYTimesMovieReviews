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
    Alamofire.request(NYTimesRouter.getDVDPicks(page: 0)).validate().responseObject { (response: DataResponse<MovieReviewResponse>) in
      let reviews = response.result.value
      if let movieReviews = reviews?.reviews {
        onSuccess(movieReviews)
      }
    }
  }
}
