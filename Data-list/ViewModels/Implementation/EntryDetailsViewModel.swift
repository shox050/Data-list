//
//  EntryDetailsViewModel.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

class EntryDetailsViewModel: EntryDetailsModel {
    private var entry: Entry!
    
    var id: String {
        return entry.id
    }
    
    var text: String {
        return entry.text
    }
    
    var dateCreated: String {
        return entry.dateCreated
    }
    
    var dateChanged: String {
        return entry.dateCreated != entry.dateChanged ? entry.dateChanged : ""
    }
    
    required init(entry: Entry) {
        self.entry = entry
    }
}

