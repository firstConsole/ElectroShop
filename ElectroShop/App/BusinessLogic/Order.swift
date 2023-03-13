//
//  Order.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 13.03.2023.
//

import Foundation

final class Order: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product?) {
        guard let product = product else {
            return
        }
        products.append(product)
        total += product.costRuble
    }
    
    func removeFromCart(product: Product) {
        products = products.filter{ $0.id != product.id }
        total -= product.costRuble
    }
}
