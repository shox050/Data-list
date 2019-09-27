//
//  EntriesResponse.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

struct EntriesResponse: Decodable {
    let status: Int
    let data: [[Entries]]
}

struct Entries: Decodable {
    let id: String
    let text: String
    let dateCreated: String
    let dateModified: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case text = "body"
        case dateCreated = "da"
        case dateModified = "dm"
    }
}

