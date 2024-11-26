//
//  ProductsViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
@MainActor
class ProductsViewModel: ObservableObject {
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
//    @Published var rating: Rating
    
    func getProducts() {
        Task {
            do {
                let fetchedProducts = try await repo.getProducts()
                self.products = fetchedProducts
                
            } catch {
                print(error)
            }
        }
    }
    
    
}
