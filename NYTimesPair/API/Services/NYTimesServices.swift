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
  func getDVDPicks(page: Int, onSuccess: @escaping([MovieReview]) -> Void, onFailure: @escaping(Error) -> Void) {
    Alamofire.request(NYTimesRouter.getDVDPicks(page: page))
      .validate()
      .responseObject { (response: DataResponse<MovieReviewResponse>) in
      switch response.result {
      case .success:
        let reviews = response.result.value
        if let movieReviews = reviews?.reviews {
          onSuccess(movieReviews)
        }
      case .failure(let error):
        onFailure(error)
      }
    }
  }
}
