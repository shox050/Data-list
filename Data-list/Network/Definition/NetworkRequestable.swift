//
//  NetworkRequestable.swift
//  Weather list
//
//  Created by Vladimir on 11/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol NetworkRequestable {
    func getSession(_ completion: @escaping(SessionResponse) -> Void)
    
    func getEntries(_ completion: @escaping (EntriesResponse) -> Void)
    
    func addEntries(withText text: String, _ completion: @escaping () -> Void)
}
