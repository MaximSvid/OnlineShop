//
//  ProductsViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
import SwiftData
@MainActor
class ProductsViewModel: ObservableObject {
    @Query var favoriteProduct: [Products]
    
    private var repo: ProductsRepository
    @Published var products: [Products] = []
    
    init(repo: ProductsRepository) {
        self.repo = repo
    }
    
    @Published var title: String = ""
    @Published var price: Double = 0.0
    @Published var description: String = ""
    @Published var category: String = ""
    @Published var image: String = ""
    @Published var rating: Rating?
    
    func addToFavorite(product: Products, context: ModelContext) {
        if !favoriteProduct.contains(where: { $0.id == product.id }) {
            context.insert(product)
            
        }
    }
    
    func removeFromFavorite(product: Products, context: ModelContext) {
        context.delete(product)
    }
    
}
