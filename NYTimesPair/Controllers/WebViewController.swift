//
//  WebViewController.swift
//  NYTimesPair
//
//  Created by Caludia Carrillo on 3/2/18.
//  Copyright © 2018 Claudia Carrillo. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
  @IBOutlet weak var webView: WKWebView!
  var articleURL: URL?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let url = articleURL else {
      return
    }
    
    let myRequest = URLRequest(url: url)
    webView.load(myRequest)
  }
}
