//
//  StarterViewController.swift
//  Data-list
//
//  Created by Vladimir on 03/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class StarterViewController: UIViewController {
    
    private enum Segue: String {
        case authorization = "segueAuthorization"
        
        case entries = "segueEntries"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let tokenRepository: TokenStorable = TokenRepository()
        
        guard (tokenRepository.getToken()) != nil else {
            print("No token")
            performSegue(withIdentifier: Segue.authorization.rawValue, sender: self)
            return
        }
        
        performSegue(withIdentifier: Segue.entries.rawValue, sender: self)
    }
}


// MARK: - StarterController
extension StarterViewController: StarterController {
    
}
