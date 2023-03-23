//
//  Network.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 23.03.2023.
//

import Foundation

protocol Authentification {
    func auth(login: String, password: String) -> Bool
}

final class Network: Authentification {
    func auth(login: String, password: String) -> Bool {
        guard let url = Bundle.main.url(forResource: "user.json", withExtension: nil) else {
            fatalError()
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        
        guard let result = try? JSONDecoder().decode(LoginResult.self, from: data).user else {
            fatalError()
        }
        
        if result.login == login && result.password == password {
            return true
        }
        
        return false
    }
}
