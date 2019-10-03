//
//  Endpoint.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoint: URLRequestConvertible {
    
    static let baseUrl = "https://bnet.i-partner.ru/testAPI/"
    
    case getToken(String, String)
    case getSession
    case getEntries
    case addEntries(String)
    
    
    var parameters: [String: Any]? {
        switch self {
        case .getToken(let name, let email):
            return [Keys.getToken: endpointPath.rawValue, Keys.name: name, Keys.email: email]
            
        case .getSession:
            return [Keys.getSession: endpointPath.rawValue]

        case .getEntries:
            guard let sessionValue = UserDefaults.standard.string(forKey: Keys.session) else {
                print("UserDefaults not have session value")
                break
            }
            return [Keys.getEntries: endpointPath.rawValue, Keys.session: sessionValue]
            
        case .addEntries(let text):
            guard let sessionValue = UserDefaults.standard.string(forKey: Keys.session) else {
                print("UserDefaults not have session value")
                break
            }
            return [Keys.session: sessionValue, Keys.body: text, Keys.addEntry: endpointPath.rawValue]
        }
        
        return nil
    }
    

    private enum EndpointPath: String {
        case getSession = "new_session"
        case getEntries = "get_entries"
        case addEntry = "add_entry"
        case getToken = "get_token"
    }
    
    private var endpointPath: EndpointPath {
        switch self {
        case .getSession: return .getSession
        case .getEntries: return .getEntries
        case .addEntries(_): return .addEntry
        case .getToken(_, _): return .getToken
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request: URLRequest = {
            var request = URLRequest(url: URL(string: Endpoint.baseUrl)!)
            
            request.httpMethod = HTTPMethod.post.rawValue
            request.addValue(NetworkServiceConfiguration().token, forHTTPHeaderField: Keys.token)
            return request
        }()
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

fileprivate struct Keys {
    static let session = "session"
    static let token = "token"
    static let body = "body"
    static let getSession = "a"
    static let addEntry = "a"
    static let getEntries = "a"
    static let getToken = "a"
    static let name = "name"
    static let email = "email"
}

// MARK: - URLConvertible
extension Endpoint: URLConvertible {
    func asURL() throws -> URL {
        return try asURLRequest().url!
    }
}

