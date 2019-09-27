//
//  ReachabilityManager.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import Alamofire

class ReachabilityManager {
    static let shared = ReachabilityManager()
    
    let manager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
    
    func startReachabilityObserver() {
        
        manager?.listener = { status in
            switch status {
            case .notReachable:
                print("The network is not reachable")
            
            case .unknown:
                print("It is unknow whether the network is reachable")
            
            case .reachable(.wwan):
                print("The network is reachable over the WWAN connection")
                
            case .reachable(.ethernetOrWiFi):
                print("The network is reachable over the WiFi connection")
            }
        }
        
        manager?.startListening()
    }
}
