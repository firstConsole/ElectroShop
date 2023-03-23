//
//  ProductCellView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 21.03.2023.
//

import SwiftUI

struct ProductCellView: View {
    @EnvironmentObject private var order: Order
    @State private var isShowAlert = false
    var product: Product
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    let imageURL = URL(string: product.photo)
                    
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 170)
                        
                    } placeholder: {
                        Text("Loading...")
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Model: " + product.name)
                            .bold()
                        
                        Text("Brand: " + product.brand)
                            .bold()
                        
                        Text("Memory: " + product.memory)
                            .bold()
                        
                        Text("Color: " + product.color)
                            .bold()
                        
                        Text("Cost: " + (product.costRuble.description) + " RUB")
                            .bold()
                        
                        Button("В корзину") {
                            isShowAlert = true
                            order.addToCart(product: product)
                        }
                        .alert("Товар \(product.name) добавлен в корзину!",
                               isPresented: $isShowAlert,
                               actions: {
                            Button("OK", role: .cancel) {}
                        })
                        .buttonStyle(.bordered)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: ProductModel.products[0])
    }
}
