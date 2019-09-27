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
    let entries: [[EntryResponse]]
    
    private enum CodingKeys: String, CodingKey {
        case status
        case entries = "data"
    }
}

struct EntryResponse: Decodable {
    let id: String
    let text: String
    let dateCreated: String
    let dateChanged: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case text = "body"
        case dateCreated = "da"
        case dateChanged = "dm"
    }
}

