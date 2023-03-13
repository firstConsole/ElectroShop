//
//  CatalogView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import SwiftUI

struct CatalogView: View {
    private var products: [Product] = ProductModel.products
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(products, id: \.id) { product in
                            let image = Bundle.main.imageLoader(url: product.photo)

                            CatalogCardView(image: Image(uiImage: image),
                                            productName: product.name,
                                            memory: product.memory,
                                            color: product.color,
                                            cost: String("\(product.costRuble)" + " ₽"))
                            .environmentObject(order)
                        }
                    }
                    .listStyle(.inset)
                }
            }
            .navigationTitle(Text("Catalog"))
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
