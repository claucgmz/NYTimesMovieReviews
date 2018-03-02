//
//  MovieReviewsViewController.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/1/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import SVProgressHUD

class MovieReviewsViewController: UIViewController {
  @IBOutlet weak var movieReviewTable: UITableView!
  var movieReviews = [MovieReview]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    HUD(show: true)
    registerNibs()
    NYTimesServices().getDVDPicks(onSuccess: { reviews in
      self.movieReviews = reviews
      self.movieReviewTable.reloadData()
      self.HUD(show: false)
    }, onFailure: {
      
    })
  }
  
  private func registerNibs() {
    movieReviewTable.register(UINib(nibName: MovieReviewCell.reusableID, bundle: nil), forCellReuseIdentifier: MovieReviewCell.reusableID)
  }
  
  private func HUD(show: Bool) {
    switch show {
    case true:
      movieReviewTable.separatorStyle = .none
      SVProgressHUD.setForegroundColor(.white)
      SVProgressHUD.setBackgroundLayerColor(.white)
      SVProgressHUD.show()
    case false:
      movieReviewTable.separatorStyle = .singleLine
      SVProgressHUD.dismiss()
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "movieReviewDetail" {
      let controller = segue.destination as! MovieReviewDetailViewController
      controller.movieReview = sender as? MovieReview
    }
  }
}

extension MovieReviewsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieReviews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieReviewCell.reusableID, for: indexPath) as! MovieReviewCell
    let review = movieReviews[indexPath.row]
    cell.configure(with: review)
    return cell
  }
}

extension MovieReviewsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "movieReviewDetail", sender: movieReviews[indexPath.row])
  }
}

extension MovieReviewDetailViewController: UITableViewDataSourcePrefetching {
  func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
    
  }
  
}
