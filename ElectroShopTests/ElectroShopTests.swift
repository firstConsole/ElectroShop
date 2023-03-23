//
//  ElectroShopTests.swift
//  ElectroShopTests
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import XCTest
@testable import ElectroShop

final class ElectroShopTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - TEST DECODE DATA
    func decodeData() -> Bool {
        let device = ProductModel.products
        
        return device.isEmpty ? false : true
    }
    
    func testDecodeData() {
        let result = decodeData()
        
        XCTAssertEqual(result, true)
    }
    
    // MARK: - TEST DO ORDER
    
    func addToCart(product: Product) -> [Product] {
        var products: [Product] = []
        
        products.append(product)
        
        return products
    }
    
    func testAddToCart() {
        let products = addToCart(product: Product(id: 1,
                                                  category: "Phones",
                                                  name: "iPhone",
                                                  description: "This is best phone",
                                                  brand: "Pear",
                                                  color: "Different",
                                                  memory: "Enermous",
                                                  costRuble: 1000000,
                                                  photo: ""))
        
        
        
        XCTAssertNotNil(products)
    }
    
    // MARK: - TEST AUTHENTIFICATION
    func testAuth() {
        let result = Network().auth(login: "Admin", password: "123")
        
        XCTAssertEqual(result, false) // just test parse user data
    }
}
