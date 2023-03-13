//
//  PromoCellView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 06.03.2023.
//

import SwiftUI

struct PromoCellView: View {
    @State var topText: String
    @State var imageFirst: Image
    @State var imageSecond: Image
    
    var body: some View {
        VStack {
            HStack {
                imageFirst
                    .resizable()
                    .frame(width: 180, height: 180)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(2)
                imageSecond
                    .resizable()
                    .frame(width: 180, height: 180)
                    .cornerRadius(20)
                    .shadow(radius: 5)
                    .padding(2)
            }
            Text(topText)
                .fontWeight(.semibold)
                .font(.title)
        }
    }
}

struct PromoCellView_Previews: PreviewProvider {
    static var previews: some View {
        PromoCellView(topText: "Лучшее предложение!",
                      imageFirst: Image("3"),
                      imageSecond: Image("4")
        )
    }
}
