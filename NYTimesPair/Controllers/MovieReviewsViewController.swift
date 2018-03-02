//
//  MovieReviewsViewController.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/1/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit

class MovieReviewsViewController: UIViewController {
  @IBOutlet weak var movieReviewTable: UITableView!
  var movieReviews = [MovieReview]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNibs()
    NYTimesServices().getDVDPicks(onSuccess: { reviews in
      self.movieReviews = reviews
      self.movieReviewTable.reloadData()
    }, onFailure: {
      
    })
  }
  
  private func registerNibs() {
    movieReviewTable.register(UINib(nibName: MovieReviewCell.reusableID, bundle: nil), forCellReuseIdentifier: MovieReviewCell.reusableID)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "movieReviewDetail" {
      let controller = segue.destination as! MovieReviewDetailViewController
      if let indexPath = movieReviewTable.indexPath(for: sender as! MovieReviewCell) {
        controller.movieReview = movieReviews[indexPath.row]
      }
    }
  }
}

extension MovieReviewsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieReviews.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieReviewCell.reusableID) as! MovieReviewCell
    let review = movieReviews[indexPath.row]
    cell.configure(with: review)
    return cell
  }
}

extension MovieReviewsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let cell = tableView.cellForRow(at: indexPath) as? MovieReviewCell else {
      return
    }
    performSegue(withIdentifier: "movieReviewDetail", sender: cell)
  }
}
