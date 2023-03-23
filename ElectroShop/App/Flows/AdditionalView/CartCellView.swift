//
//  CartCellView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 23.03.2023.
//

import SwiftUI

struct CartCellView: View {
    @EnvironmentObject var order: Order
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            let imageURL = URL(string: product.photo)
            
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
            } placeholder: {
                Text("Loading...")
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Model: " + product.name)
                    .bold()
                
                Text("Memory: " + product.memory)
                    .bold()
                
                Text("Cost: " + (product.costRuble.description) + " RUB")
                    .bold()
                
            }
            Spacer()
            
            Image(systemName: "trash")
                .padding(.horizontal)
                .font(Font.system(size: 24))
                .foregroundColor(.red)
                .bold()
                .onTapGesture {
                    withAnimation {
                        order.removeFromCart(product: product)
                    }
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CartCellView_Previews: PreviewProvider {
    static var previews: some View {
        CartCellView(product: ProductModel.products[0])
            .environmentObject(Order())
    }
}
