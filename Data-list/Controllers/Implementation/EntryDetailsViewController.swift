//
//  EntryDetailsViewController.swift
//  Data-list
//
//  Created by Vladimir on 27/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class EntryDetailsViewController: UIViewController {
    
    private var infoViewModel: EntryDetailsViewModel!
    
    @IBOutlet private weak var lDateCreated: UILabel!
    @IBOutlet private weak var lDateChanged: UILabel!
    @IBOutlet private weak var tvText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
}


extension EntryDetailsViewController {
    
    private func setUp() {
        guard infoViewModel != nil else {
            print("Error, infoViewModel == nil")
            return
        }
        
        lDateCreated?.text = infoViewModel.dateCreated
        lDateChanged?.text = infoViewModel.dateChanged
        tvText?.text = infoViewModel.text
    }
}


// MARK: - InfoController
extension EntryDetailsViewController: EntryDetailsController {
    func configure(with configuration: InfoConfiguration) {
        infoViewModel = EntryDetailsViewModel(entry: configuration.entry)
        
        setUp()
    }
}
