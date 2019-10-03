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
        authorization()
    }
    
    let networkService = NetworkService()
    let authorizationViewModel = AuthorizationViewModel()
    
//    let authorizationPathConfiguration = AuthorizationPathConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func authorization() {
        
        guard let name = tfName.text else { return }
        guard let email = tfEmail.text else { return }
        
        authorizationViewModel.authorization(with: name, email: email) {
            
        }
    }
}
