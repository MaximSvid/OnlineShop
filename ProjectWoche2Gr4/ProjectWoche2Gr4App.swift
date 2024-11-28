//
//  ProjectWoche2Gr4App.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI

@main
struct ProjectWoche2Gr4App: App {
    
        
//    @ObservedObject var productsViewModel: ProductsViewModel
    var body: some Scene {
        WindowGroup {
            AuthWrapper()
                .modelContainer(for: [Products.self], inMemory: true)
        }
    }
}
