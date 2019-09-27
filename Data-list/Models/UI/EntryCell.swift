//
//  EntryCell.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {
    
    private let lenght = 200
    
    @IBOutlet private weak var lDateCreated: UILabel!
    @IBOutlet private weak var lDateChanged: UILabel!
    @IBOutlet private weak var lText: UILabel!
    
    
    private func cropText(_ text: String) -> String {
        
        guard text.count > lenght else {
            return text
        }
        
        let index = text.index(text.startIndex, offsetBy: lenght)
        return String(text[..<index])
    }
}

extension EntryCell: Configurable {
    typealias DataSourceType = Entry
    
    func configure(with dataSource: EntryCell.DataSourceType) {
        
        lDateChanged.text = ""
        
        if dataSource.dateCreated != dataSource.dateChanged {
            lDateChanged.text = dataSource.dateChanged
        }
        
        lDateCreated.text = dataSource.dateCreated
        lText.text = cropText(dataSource.text)
    }
}
