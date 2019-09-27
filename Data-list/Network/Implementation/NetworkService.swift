//
//  NetworkService.swift
//  Current weather
//
//  Created by Vladimir on 24/08/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    private let networkServiceConfiguration = NetworkServiceConfiguration()
    private let sessionManager = Alamofire.SessionManager()
    private let executionQueue = DispatchQueue(label: "NetworkExecutionQueue",
                                               qos: .userInitiated,
                                               attributes: .concurrent)
    
    private func defaultRequest(_ endpoint: Endpoint,
                                _ completion: @escaping (DataResponse<Data>) -> Void) {
        
        sessionManager.request(endpoint)
            .validate()
            .responseData(queue: executionQueue) { response in
                completion(response)
                return
        }
    }
}


// MARK: - NetworkRequestable
extension NetworkService: NetworkRequestable {
    func getSession(_ completion: @escaping(SessionResponse) -> Void) {
        
        defaultRequest(.newSession) { response in
            guard let responseData = response.data else {
                print("No data from response - getSession")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let sessionResponse = try decoder.decode(SessionResponse.self, from: responseData)
                print("sessionResponse ", sessionResponse)
                completion(sessionResponse)
                return
                
            } catch let error {
                print("Decode SessionResponse cacth error: ", error)
            }
        }
    }
    
    
    func getEntries(_ completion: @escaping (EntriesResponse) -> Void) {
        
        defaultRequest(.listEntries) { response in
            guard let responseData = response.data else {
                print("No data from response - getEntries")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let entrisResponse = try decoder.decode(EntriesResponse.self, from: responseData)
                print("entrisResponse ", entrisResponse)
                completion(entrisResponse)
                return
                
            } catch let error {
                print("Decode EntriesResponse catch error: ", error)
            }
        }
    }
    
    
    func addEntries(withText text: String, _ completion: @escaping () -> Void) {
        defaultRequest(.addEntries(text)) { response in
            guard let responseData = response.data else {
                print("No data from response - addEntries")
                return
            }
            
            print(String(data: responseData, encoding: .utf8))
            completion()
            return
        }
    }
}
