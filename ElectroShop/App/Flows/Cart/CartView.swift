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
            ZStack {
                VStack {
                    
                }
            }
        }
        .navigationTitle(Text("Cart"))
    }
}

struct CartView_Preview: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(Order())
    }
}
