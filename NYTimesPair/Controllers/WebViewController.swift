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
  var urlString: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let url = urlString else {
      return
    }
    
    let myURL = URL(string: url)
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
  }
  
}
