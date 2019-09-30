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
    
    let manager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
    
    var isFirstLaunch = true
    
    func startReachabilityObserver() {
        manager?.startListening()

        manager?.listener = { [weak self] status in
            
            guard let this = self else { return }
            
            switch status {
            case .notReachable, .unknown:
                print("The network is not reachable")
                this.showAlertNotRachable()
                this.isFirstLaunch = false
                
            case .reachable(.wwan), .reachable(.ethernetOrWiFi):
                
                if !this.isFirstLaunch {
                    this.showAlertForReachable()
                }
                this.isFirstLaunch = false
                print("The network is reachable")
            }
        }
    }
    
    private func showAlertNotRachable() {
        let alertController = UIAlertController(title: "The network is not reachable",
                                                message: "Please refresh data, when network will be reachable",
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alertController.show()
    }
    
    private func showAlertForReachable() {
        let alertController = UIAlertController(title: "The network is reachable",
                                                message: "You can refresh data",
                                                preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Refresh",
                                                style: .default,
                                                handler: { action in
            NotificationCenter.default.post(name: .networkIsReachable, object: nil)
        }))
        alertController.show()
    }
}
