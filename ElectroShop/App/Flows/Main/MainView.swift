//
//  MainView.swift
//  ElectroShop
//
//  Created by Алексей Артамонов on 05.03.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var order = Order()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CatalogView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Catalog")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            CartView().environmentObject(order)
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
            LoginView()
                .tabItem {
                    Image(systemName: "person.crop.circle.dashed")
                    Text("Profile")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
