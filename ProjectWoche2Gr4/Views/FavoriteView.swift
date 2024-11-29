//
//  FavoriteView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Environment(\.modelContext) private var context
    @Query private var favoriteProducts: [Products]
    @ObservedObject var productsViewModel: ProductsViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if favoriteProducts.isEmpty {
                    Text("No favorite products yet.")
                        .foregroundStyle(.gray)
                        .font(.headline)
                } else {
                    List (favoriteProducts) {product in
                        HStack {
                            AsyncImage(url: URL(string: product.image)) {
                                image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            } placeholder: {
                                Color.gray.frame(width: 80, height: 80)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.body.bold())
                                    .padding(.bottom,4)
                                Text("$\(product.price, specifier: "%.2f")")
                                    .font(.footnote)
                                    .foregroundStyle(.black.opacity(0.8))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                productsViewModel.removeFromFavorite(product: product, context: context)
                                
                            }) {

                                Image(systemName: "trash")
                                    .font(.footnote)
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem (placement: .topBarLeading) {
                    Text("Favorite")
                        .font(.title.bold())
                }
            }
        }
        
    }

}


#Preview {
    //    FavoriteView()
}
