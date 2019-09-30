//
//  AddEntryViewController.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

protocol AddEntryDelegate: class {
    func didAddEntry()
}

class AddEntryViewController: UIViewController {
    
    weak var delegate: AddEntryDelegate?
        
    private let addEntryViewModel = AddEntryViewModel()
    
    
    @IBOutlet private weak var tvText: UITextView!
    
    @IBAction private func actionAdd(_ sender: UIButton) {
        sender.isEnabled = false
        addEntryViewModel.addEntry(withText: tvText.text) { [weak self] in
            self?.delegate?.didAddEntry()
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvText.becomeFirstResponder()
    }
}


// MARK: - AddEntryController
extension AddEntryViewController: AddEntryController {
    
}

