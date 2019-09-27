//
//  AddEntryViewController.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

protocol AddEntryDelegate: class {
    func didAdd(_ entry: EntryResponse)
}

class AddEntryViewController: UIViewController {
    
    weak var delegate: AddEntryDelegate?
    
    @IBOutlet private weak var tvText: UITextView!
    
    @IBAction private func actionAdd(_ sender: UIButton) {
        
    }
    
    @IBAction private func actionCancel(_ sender: UIButton) {
//        delegate?.didAdd(<#T##entry: Entries##Entries#>)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

