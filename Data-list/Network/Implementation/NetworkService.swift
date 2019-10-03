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
        }
    }
}


// MARK: - NetworkRequestable
extension NetworkService: NetworkRequestable {
    
    func getToken(byName name: String, email: String, _ completion: @escaping(RequestResult<Data, ResponseError>) -> Void) {
        
        executionQueue.async { [weak self] in
            
            self?.defaultRequest(.getToken(name, email), { response in
                
                if let error = response.error {
                    print("Response in method getToken have error: ", error)
                    completion(.failure(.network))
                    return
                }
                
                guard let responseData = response.data else {
                    print("No data from response - getToken")
                    completion(.failure(.parsing))
                    return
                }
                
                completion(.success(responseData))
            })
        }
    }
    
    func getSession<T>(responseType: T.Type, _ completion: @escaping(RequestResult<SessionResponse, ResponseError>) -> Void) where T: Decodable {
        
        executionQueue.async { [weak self] in
            self?.defaultRequest(.getSession) { response in
                
                if let error = response.error {
                    print("Response in method getSession have error: ", error)
                    completion(.failure(.network))
                    return
                }
                
                guard let responseData = response.data else {
                    print("No data from response - getSession")
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let sessionResponse = try decoder.decode(SessionResponse.self, from: responseData)
                    print("sessionResponse ", sessionResponse)
                    completion(.success(sessionResponse))
                    
                } catch let error {
                    print("Decode SessionResponse cacth error: ", error)
                    completion(.failure(.decoding))
                }
            }
        }
    }
    
    
    func getEntries<T>(responseType: T.Type, _ completion: @escaping (RequestResult<EntriesResponse, ResponseError>) -> Void) {
        
        executionQueue.async { [weak self] in
            self?.defaultRequest(.getEntries) { response in
                
                if let error = response.error {
                    print("Response in method getEntries have error: ", error)
                    completion(.failure(.network))
                    return
                }
                
                guard let responseData = response.data else {
                    print("No data from response - getEntries")
                    completion(.failure(.parsing))
                    return
                }
                
                let decoder = JSONDecoder()
                
                do {
                    let entrisResponse = try decoder.decode(EntriesResponse.self, from: responseData)
                    completion(.success(entrisResponse))
                    
                } catch let error {
                    print("Decode EntriesResponse catch error: ", error)
                    completion(.failure(.decoding))
                }
            }
        }
    }
    
    
    func addEntry(withText text: String, _ completion: @escaping (RequestResult<Data, ResponseError>) -> Void) {
        
        executionQueue.async { [weak self] in
            self?.defaultRequest(.addEntries(text)) { response in
                
                if let error = response.error {
                    print("Response in method addEntry have error: ", error)
                    completion(.failure(.network))
                    return
                }
                
                guard let data = response.data else {
                    completion(.failure(.parsing))
                    return
                }
                                
                completion(.success(data))
            }
        }
    }
}
