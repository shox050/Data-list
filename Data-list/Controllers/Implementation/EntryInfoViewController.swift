//
//  EntryInfoViewController.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class EntryInfoViewController: UIViewController {
    
    @IBOutlet private weak var lDateCreated: UILabel!
    @IBOutlet private weak var lDateChanged: UILabel!
    @IBOutlet private weak var tvText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

// MARL: - Configurable
extension EntryInfoViewController: Configurable {
    typealias DataSourceType = Entry
    
    func configure(with dataSource: Entry) {
        
    }
}
