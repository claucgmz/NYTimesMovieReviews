//
//  MovieReviewDetailViewController.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/2/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

class MovieReviewDetailViewController: UITableViewController {
  var movieReview: MovieReview?
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var movieImage: UIImageView!
  @IBOutlet weak var headlineLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var summaryLabel: UILabel!
  @IBOutlet weak var releaseDateLabel: UILabel!
  @IBOutlet weak var articleURLLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let review = movieReview else {
      return
    }
    
    titleLabel.text = review.title
    if let url = review.imageURL {
      movieImage.af_setImage(withURL: url)
    }
    headlineLabel.text = review.headline
    authorLabel.text = "by \(review.author)"
    releaseDateLabel.text = "Release date: \(review.releaseDate != "" ? review.releaseDate : "TBA" )"
    summaryLabel.text = review.summary
    articleURLLabel.text = "\(review.articleText) >>"
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "fullArticle" {
      let controller = segue.destination as! WebViewController
      controller.articleURL = movieReview?.articleURL
    }
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    if indexPath.row == 6 {
      return indexPath
    }
    else{
      return nil
    }
  }
}
