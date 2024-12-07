//
//  WebViewController.swift
//  FoodPin
//
//  Created by Myung Woo on 9/10/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let url = URL(string: targetURL){
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBOutlet var webView: WKWebView!
    
    var targetURL = ""
}
