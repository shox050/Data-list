//
//  EntryResponseConverter.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

class EntryResponseConverter {
    
    private func getDate(fromTimeInterval interval: String) -> String {
        guard let interval = Double(interval) else {
            print("Cant convert interval from String to Double")
            return "Wrong date"
        }
        
        let date = Date(timeIntervalSince1970: interval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        return dateFormatter.string(from: date)
    }
}


// MARK: - EntryResponseConvertable
extension EntryResponseConverter: EntryResponseConvertable {
    func convert(_ entryResponse: EntryResponse) -> Entry {
        
        let id = entryResponse.id
        let text = entryResponse.text
        let dateCreate = getDate(fromTimeInterval: entryResponse.dateCreated)
        let dateChanged = getDate(fromTimeInterval: entryResponse.dateChanged)
        
        return Entry(id: id, text: text, dateCreated: dateCreate, dateChanged: dateChanged)
    }
}
