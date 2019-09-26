//
//  Configurable.swift
//  Data-list
//
//  Created by Vladimir on 26/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype DataSourceType
    
    func configure(with dataSource: DataSourceType)
}
