//
//  Untitled.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

/*
 [
   "electronics",
   "jewelery",
   "men's clothing",
   "women's clothing"
 ]
 */

enum Category: String, CaseIterable {
    case electronics
    case jewelry
    case menClothing
    case womenClothing

    var icon: String {
        switch self {
        case .electronics: return "iphone"
        case .jewelry: return "diamond"
        case .menClothing: return "tshirt"
        case .womenClothing: return "figure.stand.dress"
        }
    }

    var title: String {
        switch self {
        case .electronics: return "Electronics"
        case .jewelry: return "Jewelry"
        case .menClothing: return "Men's Clothing"
        case .womenClothing: return "Women's Clothing"
        }
    }
}
