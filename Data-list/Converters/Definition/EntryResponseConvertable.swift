//
//  EntryResponseConvertable.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol EntryResponseConvertable {
    func convert(_ entryResponse: EntryResponse) -> Entry
}
