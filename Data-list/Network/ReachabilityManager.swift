//
//  ReachabilityManager.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit
import Alamofire

class ReachabilityManager {
    static let shared = ReachabilityManager()
    
    let manager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    func startReachabilityObserver() {
        manager?.listener = { [weak self] status in
            
            guard let this = self else { return }
            
            switch status {
            case .notReachable:
                print("The network is not reachable")
                this.showAlert(withTitle: "The network is not reachable",
                               message: "Please refresh data, when network will be reachable")
            
            case .unknown:
                print("It is unknow whether the network is reachable")
                this.showAlert(withTitle: "The network is not reachable",
                               message: "Please refresh data, when network will be reachable")
                
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
            }
        }
        
        manager?.startListening()
    }
    
    func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.show()
    }
}
