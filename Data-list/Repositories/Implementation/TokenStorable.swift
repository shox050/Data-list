//
//  TokenStorable.swift
//  Data-list
//
//  Created by Vladimir on 03/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol TokenStorable {
    func getToken() -> String?
    func setToken(_ token: String)
}
