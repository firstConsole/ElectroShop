//
//  Order.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 13.03.2023.
//

import Foundation

final class Order: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var totalCost: Int = 0
    
    func addToCart(product: Product) {
        products.append(product)
        totalCost += product.costRuble
        
        print(products.count)
        print(products.description)
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        totalCost -= product.costRuble
    }
}
