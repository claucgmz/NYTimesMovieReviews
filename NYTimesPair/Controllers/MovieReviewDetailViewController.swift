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
    titleLabel.text = movieReview?.title
    if let url = movieReview?.imageURL {
      movieImage.af_setImage(withURL: url)
    }
    headlineLabel.text = movieReview?.headline
    if let author = movieReview?.author {
      authorLabel.text = "by \(author)"
    }
    if let summary = movieReview?.summary {
      summaryLabel.text = summary
    }
    if let date = movieReview?.releaseDate {
      releaseDateLabel.text = "Release date: \(date != "" ? date : "TBA" )"
    }
    if let text = movieReview?.articleText {
      articleURLLabel.text = "\(text) >>"
    }
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
