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
    
    case newSession
    case listEntries
    case addEntries(String)
    
    var parameters: [String: Any]? {
        switch self {
        case .newSession:
            return ["a": "new_session"]

        case .listEntries:
            guard let session = UserDefaults.standard.string(forKey: "session") else {
                print("UserDefaults not have session value")
                break
            }
            return ["a": "get_entries", "session": session]
            
        case .addEntries(let text):
            guard let session = UserDefaults.standard.string(forKey: "session") else {
                print("UserDefaults not have session value")
                break
            }
            return ["session": session, "body": text, "a": "add_entry"]
        }
        
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        let request: URLRequest = {
            var request = URLRequest(url: URL(string: Endpoint.baseUrl)!)

            request.httpMethod = HTTPMethod.post.rawValue
            request.addValue(NetworkServiceConfiguration().token, forHTTPHeaderField: "token")
            return request
        }()
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

// MARK: - URLConvertible
extension Endpoint: URLConvertible {
    func asURL() throws -> URL {
        return try asURLRequest().url!
    }
}

