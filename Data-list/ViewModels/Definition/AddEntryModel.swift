//
//  AddEntryModel.swift
//  Data-list
//
//  Created by Vladimir on 30/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol AddEntryModel {
    func addEntry(withText text: String, _ completion: @escaping () -> Void)
}
