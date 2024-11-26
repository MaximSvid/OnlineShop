//
//  HomeViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var images = ["image1", "image2", "image3", "image4"]
    @Published var searchText: String = ""
    @Published var isSearchVisible: Bool = false
    @Published var selectedCategory: Bool = false
    @Published var isLiked: Bool = false
    
    private var repo: ProductsRepository
    @Published var products: [Products] = []
    
    init(repo: ProductsRepository) {
        self.repo = repo
    }
    
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
