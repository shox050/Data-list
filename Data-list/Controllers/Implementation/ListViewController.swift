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
    @IBAction private func actionAddEntry(_ sender: UIBarButtonItem) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        listViewModel.getSession() {
//            self.listViewModel.addEntries(withText: "Hello, world!") {
//                self.listViewModel.getEntries()
//            }
//        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let destinationVC = segue.destination as? AddEntryController {
            
        }
        
        
    }
}

// MARK: - UITableViewDataSource
extension ListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.entriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: "entryCell") as? EntryCell else {
            return UITableViewCell()
        }
        
        entryCell.configure(with: listViewModel.entriesArray[indexPath.row])
        
        return entryCell
    }
}

// MARK: - UITableViewDelegate
extension ListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}
