//
//  AuthorizationPathConfiguration.swift
//  Data-list
//
//  Created by Vladimir on 25/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

//struct AuthorizationPathConfiguration {
//
////    var url: URL? {
////        var urlComponents = URLComponents()
////
////        urlComponents.scheme = "https"
////        urlComponents.host = "bnet.i-partner.ru"
////        urlComponents.path = "/testAPI"
////
////        urlComponents.queryItems = [URLQueryItem(name: Keys.token, value: Parameters.requestToken)]
////
////        return urlComponents.url
////    }
//
//    func authorizationUrl(with name: String, _ email: String) -> URLRequest? {
//
//        var urlComponents = URLComponents()
//
//        urlComponents.scheme = "https"
//        urlComponents.host = "bnet.i-partner.ru"
//        urlComponents.path = "/testAPI"
//
//        urlComponents.queryItems = [URLQueryItem(name: Keys.token, value: Parameters.requestToken),
//                                    URLQueryItem(name: Keys.name, value: name),
//                                    URLQueryItem(name: Keys.email, value: email)]
//
//        guard let url = urlComponents.url else { return nil }
//        var request = URLRequest(url: url)
//
//
//
//        return urlComponents.url
//    }
//}
//
//extension AuthorizationPathConfiguration {
//
//    private struct Parameters {
//        static let requestToken = "request_token"
//    }
//
//    private struct Keys {
//        static let token = "a"
//        static let name = "name"
//        static let email = "email"
//    }
//}
