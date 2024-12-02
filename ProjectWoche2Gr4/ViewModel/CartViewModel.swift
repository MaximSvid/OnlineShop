//
//  CartViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Hamzah on 27.11.24.
//

import SwiftUI
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    func addItem(_ product: Products) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            let newItem = CartItem(id: product.id, product: product, quantity: 1)
            cartItems.append(newItem)
        }
    }

    func removeItem(_ product: Products) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }

    var total: Double {
        cartItems.reduce(0) { $0 + $1.product.price * Double($1.quantity) }
    }

    func clearCart() {
        cartItems.removeAll()
    }
}

struct CartItem: Identifiable {
    var id: Int
    var product: Products
    var quantity: Int
}
