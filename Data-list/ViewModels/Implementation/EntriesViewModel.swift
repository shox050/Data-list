//
//  EntriesViewModel.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

class EntriesViewModel {
    
    var entries: [Entry] = []
    
    private let networkService: NetworkRequestable = NetworkService()
    private let entryResponseConverter: EntryResponseConvertable = EntryResponseConverter()
    
    
    
}

// MARK: - Methods
extension EntriesViewModel {
    func getSession(_ completion: @escaping () -> Void) {
        
        guard UserDefaults.standard.string(forKey: Keys.session) == nil else {
            print("UserDefault have session value: ", UserDefaults.standard.string(forKey: Keys.session))
            completion()
            return
        }
        
        networkService.getSession(responseType: SessionResponse.self) { response in
            
            switch response {
            case .failure(let error):
                print(error)
                
            case .success(let sessionResponse):
                UserDefaults.standard.set(sessionResponse.data.session, forKey: Keys.session)
                print("Session value is got: ", sessionResponse.data.session)
                completion()
            }
        }
    }
    
    func getEntries(_ completion: @escaping () -> Void) {
        networkService.getEntries(responseType: EntriesResponse.self) { [weak self] response in
            guard let this = self else { return }
            
            switch response {
            case .failure(let error):
                print(error)
                
            case .success(let entriesResponse):
                this.entries = []
                
                entriesResponse.entries.forEach { data in
                    data.forEach { entry in
                        this.entries.append(this.entryResponseConverter.convert(entry))
                    }
                }
                
                completion()
            }
            

        }
    }
    
    private struct Keys {
        static let session = "session"
    }
}
