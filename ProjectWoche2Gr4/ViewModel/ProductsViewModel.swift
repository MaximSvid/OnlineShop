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
    
    private var repo: ProductsRepository
    @Published var products: [Products] = []
    @Published var favoriteProducts: [Products] = []
    
    init(repo: ProductsRepository) {
        self.repo = repo
    }
    
    @Published var title: String = ""
    @Published var price: Double = 0.0
    @Published var description: String = ""
    @Published var category: String = ""
    @Published var image: String = ""
    @Published var rating: Rating?
    
    @Published var isFavorite: Bool = false
    
    func addToFavorite(product: Products, context: ModelContext) {
        product.isFavorite = true
        context.insert(product)
        do {
            try context.save()
        } catch {
            print("Failed to save product: \(error)")
        }
    }
    
    func removeFromFavorite(product: Products, context: ModelContext) {
        product.isFavorite = false
        context.delete(product)
        do {
            try context.save()
        } catch {
            print("Failed to remove product: \(error)")
        }
    }
    
    func loadFavoriteStatus(product: Products, context: ModelContext) -> Bool {
            let fetchDescriptor = FetchDescriptor<Products>(predicate: #Predicate { $0.id == product.id })
            do {
                let results = try context.fetch(fetchDescriptor)
                if let fetchedProduct = results.first {
                    return fetchedProduct.isFavorite
                }
            } catch {
                print("Failed to load favorite status: \(error)")
            }
            return false
        }
  
}
