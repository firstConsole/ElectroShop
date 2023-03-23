//
//  LoginResult.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 23.03.2023.
//

import Foundation

struct LoginResult: Codable {
    let user: User
}

struct User: Codable, Identifiable {
    let id: Int
    let login: String
    let password: String
    let name: String
    let lastName: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case password
        case name
        case lastName = "lastname"
        case photo
    }
}
