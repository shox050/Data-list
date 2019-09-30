//
//  EntriesViewController.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class EntriesViewController: UITableViewController {
    
    private let listViewModel = EntriesViewModel()
    fileprivate var infoConfiguration: InfoConfiguration?

    
    @IBOutlet private weak var tvList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(networkIsReachable),
                                               name: .networkIsReachable, object: nil)
                        
        listViewModel.getSession() { [weak self] in
            guard let this = self else { return }
            
            this.listViewModel.getEntries() {
                DispatchQueue.main.sync {
                    this.tvList.reloadData()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? EntryDetailsController {
            guard let infoConfiguration = infoConfiguration else {
                fatalError("entryConfiguration must be set prior to InfoViewController presentation")
            }
            
            destinationVC.configure(with: infoConfiguration)
            self.infoConfiguration = nil
        }
        
        if var destinationVC = segue.destination as? AddEntryController {
            destinationVC.delegate = self
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .networkIsReachable, object: nil)
    }

}

// MARK: - UITableViewDataSource
extension EntriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: "entryCell") as? EntryCell else {
            return UITableViewCell()
        }
        
        entryCell.configure(with: listViewModel.entries[indexPath.row])
        
        return entryCell
    }
}

// MARK: - UITableViewDelegate
extension EntriesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        infoConfiguration = InfoConfiguration(entry: listViewModel.entries[indexPath.row])
        
        performSegue(withIdentifier: "showEntryInfoViewController", sender: self)
    }
}


// MARK: - AddEntryDelegate
extension EntriesViewController: AddEntryDelegate {
    func didAddEntry() {
        listViewModel.getEntries { [weak self] in
            DispatchQueue.main.sync {
                self?.tvList.reloadData()
            }
        }
    }
}


extension EntriesViewController {
    @objc func networkIsReachable() {
        listViewModel.getEntries { [weak self] in
                        
            DispatchQueue.main.sync {
                self?.tvList.reloadData()
            }
        }
    }
}


// MARK: - EntriesController
extension EntriesViewController: EntriesController {
    
}
