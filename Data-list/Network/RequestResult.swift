//
//  RequestResult.swift
//  Data-list
//
//  Created by Vladimir on 30/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

enum RequestResult<T, F> where F: Error {
    case success(T)
    case failure(F)
}
