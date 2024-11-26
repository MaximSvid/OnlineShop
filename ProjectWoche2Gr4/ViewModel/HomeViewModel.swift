//
//  HomeViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var images = ["image1", "image2", "image3", "image4"]
    @Published var isSearchVisible: Bool = false
    @Published var selectedCategory: Bool = false
    @Published var isLiked: Bool = false
    
    @Published var searchText: String = ""
    @Published var filteredProducts: [Products] = []
    
    private var repo: ProductsRepository
    private var cancellables = Set<AnyCancellable>()
    @Published var products: [Products] = []
    
    init(repo: ProductsRepository) {
        self.repo = repo
        //мгновенный поиск
        $searchText
                    .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
                    .sink { [weak self] _ in
                        self?.filerProducts()
                    }
                    .store(in: &cancellables)
       
    }
    
    func getProducts() {
        Task {
            do {
                let fetchedProducts = try await repo.getProducts()
                self.products = fetchedProducts
                self.filteredProducts = fetchedProducts
            } catch {
                print(error)
            }
        }
    }
    
    func filerProducts() {
        if searchText.isEmpty {
            filteredProducts = products
        } else {
            filteredProducts = products.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    

    
}
