//
//  EntryDetailsModel.swift
//  Data-list
//
//  Created by Vladimir on 30/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol EntryDetailsModel {
    var id: String { get }
    var text: String { get }
    var dateCreated: String { get }
    var dateChanged: String { get }
    init(entry: Entry)
}
