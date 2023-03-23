//
//  ProductDetailView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 19.03.2023.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var showAlert: Bool = false
    @EnvironmentObject private var order: Order
    
    var product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                // MARK: - main image and name of chosen product
                
                VStack(alignment: .center) {
                    let imageURL = URL(string: product.photo)
                    
                    AsyncImage(url: imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 370)
                        
                    } placeholder: {
                        Text("Loading image...")
                    }
                    
                    Text(String(product.costRuble) + " RUB")
                        .fontWeight(.heavy)
                        .font(.title)
                        .foregroundColor(.red)
                    
                    Text(product.brand + " " + product.name)
                        .fontWeight(.heavy)
                        .font(.title)
                    
                    Button {
                        showAlert = true
                    } label: {
                        Text("В корзину")
                            .bold()
                            .font(Font.system(size: 24))
                            .foregroundColor(.green)
                            .padding(.top, 2)
                            .padding(.bottom, 2)
                    }
                    .alert("Товар \(product.name) добавлен в корзину!",
                           isPresented: $showAlert,
                           actions: {
                        Button("OK", role: .cancel) {}
                    })
                    .buttonStyle(.bordered)
                    
                    Divider()
                }
                
                // MARK: - Specifications
                
                VStack {
                    Text("Характеристики:")
                        .foregroundColor(.gray)
                        .bold()
                        .font(Font.system(size: 24))
                }
                .padding(.top, 5)
                .padding(.leading, 20)
                
                VStack(alignment: .leading) {
                    Text("- Бренд: " + product.brand)
                        .modifier(Specifications())
                    
                    Text("- Модель: " + product.name)
                        .modifier(Specifications())
                    
                    Text("- Объём памяти: " + product.memory)
                        .modifier(Specifications())
                    
                    Text("- Цвет: " + product.color)
                        .modifier(Specifications())
                    
                    Divider()
                }
                .padding(.top, 2)
                
                VStack(alignment: .leading) {
                    Text("Описание:")
                        .foregroundColor(.gray)
                        .bold()
                        .font(Font.system(size: 24))
                }
                .padding(.top, 5)
                .padding(.leading, 20)
                
                VStack {
                    Text(product.description)
                        .padding(.leading, 30)
                        .padding(.trailing, 30)
                        .font(Font.system(size: 22))
                        .bold()
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ProductModel.products[0])
            .environmentObject(Order())
    }
}
