//
//  AuthorizationViewModel.swift
//  Data-list
//
//  Created by Vladimir on 02/10/2019.
//  Copyright © 2019 VladimirYakutin. All rights reserved.
//

import UIKit

class AuthorizationViewModel {
    
    let tokenRepository: TokenStorable = TokenRepository()
    let networkService: NetworkRequestable = NetworkService()
    
}

extension AuthorizationViewModel {
    func authorization(with name: String, email: String, _ completion: @escaping() -> Void) {
        
        networkService.getToken(byName: name, email: email) { [weak self] response in
            switch response {
            case .failure(let error):
                print("Method authorization get error from response: ", error)
                
            case .success(let responseData):
                guard let token = self?.fetchToken(from: responseData) else {
                    print("Token not got, authorization is failed")
                    return
                }
                
                self?.tokenRepository.setToken(token)
                
                completion()
            }
        }
    }
    
    
    private func fetchToken(from data: Data) -> String? {
        
        guard let responseString = String(data: data, encoding: .utf8) else {
            print("Cant get string from data - method fetchToken")
            return nil
        }
        
        guard responseString.contains("token") else {
            print("responseString not contain token")
            return nil
        }
        
        let char = ":"
        let separatedString = responseString.components(separatedBy: "\"").filter {
            let a = $0
            if a == char {
                return false
            }
            return true
        }
        
        var token: String?
        
        for (i, element) in separatedString.enumerated() {
            if element == "token" {
                token = separatedString[i + 1]
                break
            }
        }
        
        return token
    }
}
