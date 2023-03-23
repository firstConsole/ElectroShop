//
//  HomeView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        PromoView(image: Image("promo_iphone"),
                                  text: Text("iPhone 13 Pro & Pro Max"))
                        PromoCellView(topText: "Смартфоны со скидкой",
                                      imageFirst: Image("3"),
                                      imageSecond: Image("2")
                        )
                    }
                }
            }
            .navigationTitle(Text("Home"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
