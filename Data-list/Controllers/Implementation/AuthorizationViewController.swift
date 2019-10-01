//
//  AuthorizationViewController.swift
//  Data-list
//
//  Created by Vladimir on 01/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import WebKit

class AuthorizationViewController: UIViewController {
    
    let authorizationPathConfiguration = AuthorizationPathConfiguration()
    @IBOutlet private weak var wvAuthorization: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = authorizationPathConfiguration.url else {
            print("No url from authorizationPathConfiguration.url")
            return
        }

        let request = URLRequest(url: url)
        
        wvAuthorization.loadRequest(request)
    }
    
    
}


extension AuthorizationViewController: WKNavigationDelegate  {
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
    }
}

