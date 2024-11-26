//
//  AppNavigation.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI

struct AppNavigation: View {
    @StateObject private var homeViewModel = HomeViewModel(repo:  ProductsRepositoryImplementation())
    
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView(homeViewModel: homeViewModel)
            }
            
            Tab("Cart", systemImage: "cart.fill") {
                CartView()
            }
            .badge(2)
            
            Tab("Favorite", systemImage: "star.fill") {
                FavoriteView()
            }
            
            Tab("Setting", systemImage: "gearshape.fill") {
                SettingView()
            }
            
        }
    }
}

#Preview {
    AppNavigation()
}
