//
//  AppNavigation.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI

struct AppNavigation: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            
            Tab("Cart", systemImage: "cart.fill") {
                CartView()
            }
            .badge(2)
            
            Tab("Favorite", systemImage: "star.fill") {
                FavoriteView()
            }
            
        }
    }
}

#Preview {
    AppNavigation()
}