//
//  AuthorizationPathConfiguration.swift
//  Data-list
//
//  Created by Vladimir on 25/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct AuthorizationPathConfiguration {
    
    var url: URL? {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "bnet.i-partner.ru"
        urlComponents.path = "/testAPI"
        
        urlComponents.queryItems = [URLQueryItem(name: Keys.token, value: Parameters.requestToken)]
                
        return urlComponents.url
    }
}

extension AuthorizationPathConfiguration { 
    
    private struct Parameters {
        static let requestToken = "request_token"
    }
    
    private struct Keys {
        static let token = "a"
    }
}
