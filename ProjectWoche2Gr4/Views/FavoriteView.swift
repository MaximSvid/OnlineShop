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
    @ObservedObject var productsViewModel: ProductsViewModel
    @ObservedObject var cartViewModel: CartViewModel
    
    // sort
    @State private var sortOption: SortOption = .title
    
    @Query(sort: \Products.price) private var productsByName: [Products]
    
    
    
    
    
    var displayedProducts: [Products] {
        switch sortOption {
        case .title:
            return productsByName.sorted { $0.title < $1.title }
        case .price:
            return productsByName
        case .rating:
            return productsByName.sorted { $0.rating.rate > $1.rating.rate }
        case .category:
            return productsByName.sorted { $0.category < $1.category }
        case .reviews:
            return productsByName.sorted { $0.rating.count > $1.rating.count }
        }
    }
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if displayedProducts.isEmpty {
                    Text("No favorite products yet.")
                        .foregroundStyle(.gray)
                        .font(.headline)
                } else {
                    List (displayedProducts) {product in
                        
                        NavigationLink(destination: HomeDetailView(
                            product: product,
                            cartViewModel: cartViewModel,
                            productsViewModel: productsViewModel)
                        ) {
                            
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
                                        .foregroundStyle(.black)
                                }
                                .buttonStyle(BorderedButtonStyle())
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
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button("Sort by Name") {
                            sortOption = .title
                        }
                        Button("Sort by Price") {
                            sortOption = .price
                        }
                        Button("Sort by Category") {
                            sortOption = .category
                        }
                        Button("Sort by Rating") {
                            sortOption = .rating
                        }
                        Button("Sort by Reviews") {
                            sortOption = .reviews
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
        
    }
    
}


#Preview {
    //    FavoriteView()
}

