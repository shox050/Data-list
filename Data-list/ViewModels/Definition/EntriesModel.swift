//
//  EntriesModel.swift
//  Data-list
//
//  Created by Vladimir on 30/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol EntriesModel {
    var entries: [Entry] { get set }
    
    func getSession(_ completion: @escaping () -> Void)
    func getEntries(_ completion: @escaping () -> Void)
}
