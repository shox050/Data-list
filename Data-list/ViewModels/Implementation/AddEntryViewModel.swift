//
//  AddEntryViewModel.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

class AddEntryViewModel: AddEntryModel {
    
    private let networkService: NetworkRequestable = NetworkService()
    
    
}


extension AddEntryViewModel {
    
    func addEntry(withText text: String, _ completion: @escaping () -> Void) {
        networkService.addEntry(withText: text) { response in
            
            switch response {
            case .failure(let error):
                print("Error response addEntry: ", error)
                
            case .success(let data):
                print(String(data: data, encoding: .utf8))
                completion()
            }
        }
    }
}
