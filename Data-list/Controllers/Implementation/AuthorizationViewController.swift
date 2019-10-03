//
//  AuthorizationViewController.swift
//  Data-list
//
//  Created by Vladimir on 01/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import Alamofire

class AuthorizationViewController: UIViewController {
    
    @IBOutlet private weak var tfName: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    
    @IBAction private func actionAuthorization(_ sender: UIButton) {
        authorization() { [weak self] in
            
            DispatchQueue.main.sync {
                self?.performSegue(withIdentifier: "showEntriesViewController", sender: self)
            }
        }
    }
    
    let networkService = NetworkService()
    let authorizationViewModel = AuthorizationViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func authorization(_ completion: @escaping () -> Void) {
        
        guard let name = tfName.text else { return }
        guard let email = tfEmail.text else { return }
        
        authorizationViewModel.authorization(with: name, email: email) {
            completion()
        }
    }
}

// MARK: - AuthorizationController
extension AuthorizationViewController: AuthorizationController {
    
}
