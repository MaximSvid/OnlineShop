//
//  HomeRepositories.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

protocol ProductsRepository {
    func getProducts() async throws -> [Products]
}
