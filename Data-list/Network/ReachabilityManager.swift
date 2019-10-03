//
//  ReachabilityManager.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import Alamofire


//ReachabilityManager work correctly on real device.
//On simulator have few problems with calling.

class ReachabilityManager {

    static let shared = ReachabilityManager()

    private let manager = Alamofire.NetworkReachabilityManager(host: "https://bnet.i-partner.ru/testAPI/")

    private var isFirstLaunch = true

    func startReachabilityObserver() {
        manager?.startListening()

        manager?.listener = { [weak self] status in

            guard let this = self else { return }

            switch status {
            case .notReachable, .unknown:
                print("The network is not reachable")
                this.showAlertNotReachable()
                this.isFirstLaunch = false

            case .reachable:

                if !this.isFirstLaunch {
                    this.showAlertForReachable()
                }
                this.isFirstLaunch = false
                print("The network is reachable")
            }
        }
    }

    private func showAlertNotReachable() {
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
