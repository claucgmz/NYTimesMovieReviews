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
  var currentPage = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNibs()
    loadReviews()
  }
  private func registerNibs() {
    movieReviewTable.register(UINib(nibName: MovieReviewCell.reusableID, bundle: nil), forCellReuseIdentifier: MovieReviewCell.reusableID)
  }
  private func loadReviews() {
    self.toogleHUD(show: true)
    NYTimesServices().getDVDPicks(page: currentPage, onSuccess: { reviews in
      self.movieReviews.append(contentsOf: reviews)
      self.movieReviewTable.reloadData()
      self.toogleHUD(show: false)
      self.currentPage += 1
    }, onFailure: { error in
      print(error)
    })
  }
  private func toogleHUD(show: Bool) {
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
      let controller = (segue.destination as? MovieReviewDetailViewController)!
      controller.movieReview = sender as? MovieReview
    }
  }
}
extension MovieReviewsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movieReviews.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = (tableView.dequeueReusableCell(withIdentifier: MovieReviewCell.reusableID, for: indexPath) as? MovieReviewCell)!
    let review = movieReviews[indexPath.row]
    cell.configure(with: review)
    return cell
  }
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let lastCell = movieReviews.count - 1
    if lastCell == indexPath.row {
      loadReviews()
    }
  }
}
extension MovieReviewsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "movieReviewDetail", sender: movieReviews[indexPath.row])
  }
}
