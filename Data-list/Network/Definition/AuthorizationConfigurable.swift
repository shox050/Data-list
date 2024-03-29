//
//  AuthorizationConfigurable.swift
//  Data-list
//
//  Created by Vladimir on 30/09/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import Foundation

protocol AuthorizationConfigurable {
    func authorizationUrl(with name: String, _ email: String) -> URL?
}
