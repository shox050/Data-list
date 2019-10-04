//
//  EntriesViewController.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class EntriesViewController: FoundationViewController {
        
    private let entriesViewModel = EntriesViewModel()
    fileprivate var infoConfiguration: InfoConfiguration?

    
    @IBOutlet private weak var tvList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reachabilityDidChange(_:)),
                                               name: ReachabilityObserver.Notification.didChange.name,
                                               object: nil)
        
        ReachabilityObserver.shared.startObsrving()

        entriesViewModel.getSession() { [weak self] in
            guard let this = self else { return }

            this.entriesViewModel.getEntries() {
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
        ReachabilityObserver.shared.stopObserving()
    }
}

// MARK: - UITableViewDataSource
extension EntriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entriesViewModel.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        guard let entryCell = tableView.dequeueReusableCell(withIdentifier: "entryCell") as? EntryCell else {
            return UITableViewCell()
        }
        
        entryCell.configure(with: entriesViewModel.entries[indexPath.row])
        
        return entryCell
    }
}

// MARK: - UITableViewDelegate
extension EntriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        infoConfiguration = InfoConfiguration(entry: entriesViewModel.entries[indexPath.row])
        
        performSegue(withIdentifier: "showEntryInfoViewController", sender: self)
    }
}


// MARK: - AddEntryDelegate
extension EntriesViewController: AddEntryDelegate {
    func didAddEntry() {
        entriesViewModel.getEntries { [weak self] in
            DispatchQueue.main.sync {
                self?.tvList.reloadData()
            }
        }
    }
}


extension EntriesViewController {
    @objc func reachabilityDidChange(_ notification: Notification) {
        
        switch ReachabilityObserver.shared.isReachable {
        case false:
            presentAlert(with: "Network is lost", message: "Check your connect")
            
        case true:
            let action = UIAlertAction(title: "Update", style: .default) { [weak self] action in
                self?.entriesViewModel.getEntries {
                    print("UPDATE")
                    DispatchQueue.main.sync {
                        self?.tvList.reloadData()
                    }
                }
            }
            
            presentAlert(with: "Network is reachable", message: "You can update data", action: action)
        }
    }
}


// MARK: - EntriesController
extension EntriesViewController: EntriesController {
    
}
