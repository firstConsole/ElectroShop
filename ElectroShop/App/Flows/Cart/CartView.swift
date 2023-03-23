//
//  CartView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            VStack {
                if order.products.isEmpty {
                    HStack {
                        Text("Нет товаров в корзине")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 24))
                        Image(systemName: "cart")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 24))
                    }

                    VStack {
                        NavigationLink {
                            CatalogView()
                        } label: {
                            Text("В КАТАЛОГ")
                                .font(Font.system(size: 20))
                                .bold()
                                .padding(2)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ForEach(order.products, id: \.id) { product in
                        CartCellView(product: product)
                        
                        HStack {
                            Text("Итого: ")
                            Spacer()
                            Text("\(order.totalCost)" + "₽")
                                .bold()
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("Корзина"))
    }
}


struct CartView_Preview: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(Order())
    }
}
