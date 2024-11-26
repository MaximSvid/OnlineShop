//
//  ProductsRepositoryMock.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

class ProductsRepositoryMock: ProductsRepository {
    
    private let products = [
        Products(id: 1, title: "T-Shirt", price: 0.0, description: "TSHIRT", category: "", image: "", rating: Rating(rate: 0.0, count: 123)),
        Products(id: 1, title: "T-Shirt", price: 0.0, description: "TSHIRT", category: "", image: "", rating: Rating(rate: 0.0, count: 123)),        Products(id: 1, title: "", price: 0.0, description: "", category: "", image: "", rating: Rating(rate: 0.0, count: 123)),
    ]
    
    func getProducts() async throws -> [Products] {
        products
    }
    
    
}
