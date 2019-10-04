//
//  FoundationViewController.swift
//  Data-list
//
//  Created by Vladimir on 04/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class FoundationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func presentAlert(with title: String,
                      message: String,
                      action: UIAlertAction? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let action = action {
            alert.addAction(action)
        } else {
            let defaultAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(defaultAction)
        }
        
        present(alert, animated: true)
    }
}
