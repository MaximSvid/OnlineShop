//
//  ProductGridView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 02.12.24.
//

import SwiftUI

struct ProductGridView: View {
    let columns: [GridItem]
    let products: [Products]
    @ObservedObject var productsViewModel: ProductsViewModel
    @ObservedObject var cartViewModel: CartViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("All Goods")
                    .font(.headline)
                Spacer()
            }
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(products) { product in
                    NavigationLink(destination: HomeDetailView(product: product, cartViewModel: cartViewModel, productsViewModel: productsViewModel)) {
                        ProductCardView(productsViewModel: productsViewModel, product: product)
                    }
                }
            }
        }
    }
}

