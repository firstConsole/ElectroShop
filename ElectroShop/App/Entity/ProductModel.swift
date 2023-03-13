//
//  ProductModel.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 08.03.2023.
//

import Foundation

// MARK: - struct ProductModel
struct ProductModel: Codable {
    let products: [Product]
    
    static let products: [Product] = Bundle.main.decodeData()
}

// MARK: - struct Product
struct Product: Codable, Identifiable {
    let id: Int
    let category: String
    let name, description: String
    let brand: String
    let color: String
    let memory: String
    let costRuble: Int
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id, category, name, description, brand, color, memory
        case costRuble = "cost_ruble"
        case photo
    }
}
