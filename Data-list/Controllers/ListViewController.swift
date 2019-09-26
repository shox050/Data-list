//
//  ListViewController.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    private let listViewModel = ListViewModel()
    
    @IBOutlet private weak var tvList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listViewModel.getSession() {
//            self.listViewModel.addEntries(withText: "Hello, world!") {
                self.listViewModel.getEntries()
//            }
        }
        

        
    }
}
