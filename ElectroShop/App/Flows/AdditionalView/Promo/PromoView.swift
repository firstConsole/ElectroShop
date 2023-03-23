//
//  PromoView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import SwiftUI

struct PromoView: View {
    @State var image: Image
    @State var text: Text
    
    var body: some View {
        ZStack {
            VStack {
                image
                    .resizable()
                    .frame(width: 400,height: 200)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                
                text
                    .frame(alignment: .leading)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView(image: Image("promo_iphone"),
                  text: Text("Лучший телефон по лучшей цене!"))
    }
}
