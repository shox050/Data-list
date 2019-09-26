//
//  SessionResponse.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct SessionResponse: Decodable {
    let status: Int
    let data: Session
    
    struct Session: Decodable {
        let session: String
    }
}
