//
//  ViewController.swift
//  iosJollyRancher
//
//  Created by Ammar Chishti on 5/28/19.
//  Copyright © 2019 Ammar Chishti. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myBtn: UIButton!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var myView: UIView!
    @IBAction func myBttn(_ sender: Any) {
        
        var x = 0
        while x < 25 {
            
            let myRandURLString = randomString(10);
            let myActualURLString = "https://www.bing.com/search?q=\(myRandURLString)"
            
            let myURLs = URL(string: myActualURLString)
            let myRequests = URLRequest(url: myURLs!)
            
            if (x < 24) { // Case 1: Search
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1*x), execute: {
                    self.webView.load(myRequests)
                })
            }
            
            else if (x == 24) { // Case 2: 25th search is the keyword "nope"  indicating so we know the searches are finished
                
                let myURL = URL(string:"https://www.bing.com/search?q=nope")
                let myRequest = URLRequest(url: myURL!)
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1*x), execute: {
                    self.webView.load(myRequest)
                })
                
            }
            
            print("\(x):",myActualURLString);
            x += 1;
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() { // Automatically activates on startup
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myBtn.layer.cornerRadius = myBtn.frame.width/2;
        myBtn.layer.masksToBounds = true;
        
        // Loading the webview
        webView = WKWebView(frame: myView.bounds, configuration: WKWebViewConfiguration())
        webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.myView.addSubview(webView)
        
        
        let myURL = URL(string:"https://www.bing.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
    // To generate the random URL's
    func randomString(_ length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    

    
}

