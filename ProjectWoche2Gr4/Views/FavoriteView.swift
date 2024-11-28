//
//  FavoriteView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Query private var favoriteProducts: [Products]
    @ObservedObject var productsViewModel: ProductsViewModel
    
    var body: some View {
        NavigationStack {
            if favoriteProducts.isEmpty {
                Text("No favorite products yet.")
                    .foregroundColor(.gray)
                    .font(.headline)
            } else {
                List(favoriteProducts) { product in
                    HStack {
                        Text(product.title) 
                            .font(.headline)
                        Spacer()
                        Text("$\(product.price, specifier: "%.2f")")
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .navigationTitle("Favorites")
    }
}


#Preview {
//    FavoriteView()
}
