//
//  CatalogCardView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 08.03.2023.
//

import SwiftUI

struct CatalogCardView: View {
    @State var image: Image
    @State var productName: String
    @State var memory: String
    @State var color: String
    @State var cost: String
    @EnvironmentObject var order: Order
    var product: Product?
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 400, height: 200)
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 2)
                
            HStack(spacing: 30) {
                image
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 150, height: 150)
                    .padding(2)
                VStack(alignment: .leading) {
                    Text(productName)
                        .bold()
                    Text(memory)
                    Text(color)
                    Text(cost)
                        .fontWeight(.heavy)
                        .foregroundColor(.green)
                        .font(.title3)
                    
                    Button("В корзину") {
                        order.addToCart(product: product)
                        print("Added")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

struct CatalogCardView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogCardView(image: Image("card"),
                        productName: "Galay A53 5G",
                        memory: "128 GB",
                        color: "Оранжевый",
                        cost: "29999 ₽").environmentObject(Order())
    }
}
