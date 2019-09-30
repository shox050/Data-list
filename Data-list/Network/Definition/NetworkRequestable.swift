//
//  NetworkRequestable.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol NetworkRequestable {
    func getSession<T>(responseType: T.Type,
                       _ completion: @escaping(RequestResult<SessionResponse, ResponseError>) -> Void) where T: Decodable
    
    func getEntries<T>(responseType: T.Type,
                       _ completion: @escaping (RequestResult<EntriesResponse, ResponseError>) -> Void)
    
    func addEntry(withText text: String,
                  _ completion: @escaping (RequestResult<Data, ResponseError>) -> Void)
}
