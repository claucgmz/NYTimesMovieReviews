//
//  MovieReviewCell.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/1/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieReviewCell: UITableViewCell {
  @IBOutlet weak var thumbnailImage: UIImageView!
  @IBOutlet weak var movieTitle: UILabel!
  @IBOutlet weak var headlineLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  
  func configure(with review: MovieReview) {
    if let url = URL(string: review.imageURL) {
      thumbnailImage.af_setImage(withURL: url)
    }
    movieTitle.text = review.title
    headlineLabel.text = review.headline
    releaseDateLabel.text = "Release date: \(review.releaseDate != "" ? review.releaseDate : "TBA" )"
  }
}
