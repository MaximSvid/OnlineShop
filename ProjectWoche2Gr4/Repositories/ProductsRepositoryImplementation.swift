//
//  ProductsRepositoryImplementation.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

class ProductsRepositoryImplementation: ProductsRepository {
    private let baseURL: String = "https://fakestoreapi.com/products"
    
    func getProducts() async throws -> [Products] {
        let products: [Products] = try await WebServiceProducts().downloadProducts(urlString: baseURL)
        
        return products
    }
}
