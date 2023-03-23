//
//  CatalogView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import SwiftUI

struct CatalogView: View {
    private var products = ProductModel.products
    @StateObject private var order = Order()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(products, id: \.id) { product in
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            ProductCellView(product: product)
                                .environmentObject(order)
                        }
                    }
                }
                .listStyle(.inset)
            }
            .navigationTitle(Text("Каталог"))
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
