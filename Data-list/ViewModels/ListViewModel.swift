//
//  ListViewModel.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

class ListViewModel {
    
    var entriesArray: [Entries] = []
    
    private let networkService: NetworkRequestable = NetworkService()
    
    
    
}

// MARK: - Methods
extension ListViewModel {
    func getSession(_ completion: @escaping () -> Void) {
        
        guard UserDefaults.standard.string(forKey: Keys.session) == nil else {
            print("UserDefault have session value: ", UserDefaults.standard.string(forKey: Keys.session))
            completion()
            return
        }
        
        networkService.getSession { response in
            UserDefaults.standard.set(response.data.session, forKey: Keys.session)
            print("Session value is got: ", response.data.session)
            completion()
            return
        }
    }
    
    func getEntries() {
        networkService.getEntries { response in
            response.data.forEach { entry in
                print(entry)
            }
            print(response)
        }
    }
    
    func addEntries(withText text: String, _ completion: @escaping () -> Void) {
        networkService.addEntries(withText: text) {
            print("Entries added")
            completion()
        }
    }
    
    private struct Keys {
        static let session = "session"
    }
}
