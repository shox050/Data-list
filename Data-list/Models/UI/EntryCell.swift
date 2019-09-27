//
//  EntryCell.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {
    
    @IBOutlet private weak var lDateCreated: UILabel!
    @IBOutlet private weak var lDateChanged: UILabel!
    @IBOutlet private weak var lText: UILabel!
    
    
    
}

extension EntryCell: Configurable {
    typealias DataSourceType = EntryResponse
    
    func configure(with dataSource: EntryCell.DataSourceType) {
        lDateCreated.text = dataSource.dateCreated
        
        
    }
}
