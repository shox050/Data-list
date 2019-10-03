//
//  TokenRepository.swift
//  Data-list
//
//  Created by Vladimir on 03/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

class TokenRepository: TokenStorable {
    
    private struct Keys {
        static let token = "authorizationToken"
    }
    
    func getToken() -> String? {
        guard let token = UserDefaults.standard.string(forKey: Keys.token) else {
            return nil
        }
        
        return token
    }
    
    func setToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: Keys.token)
    }
}
