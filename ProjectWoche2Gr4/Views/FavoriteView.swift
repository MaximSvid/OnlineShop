//
//  FavoriteView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Query var favoriteProducts: [Products]
    @ObservedObject var productsViewModel: ProductsViewModel
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    private var filteredProducts: [Products] {
        productsViewModel.favoriteProduct.compactMap { favorite in
            productsViewModel.products.first { $0.id == favorite.id }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(filteredProducts, id: \.id) { product in
                        ProductCardView(productsViewModel: productsViewModel, product: product)
                    }
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Favorite View")
                        .font(.title.bold())
                        .foregroundStyle(.black)
                }
            }
        }
    }
}


#Preview {
//    FavoriteView()
}
