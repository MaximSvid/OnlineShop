//
//  Products.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI
import SwiftData

@Model
class Products: Codable, Identifiable {
    var id: Int
    var title: String
    var price: Double
    var descriptionProduct: String
    var category: String
    var image: String
    var rating: Rating
    
    var isFavorite: Bool = false
   
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case image = "image"
        case rating = "rating"
      
    }
    init(id: Int,
         title: String,
         price: Double,
         description: String,
         category: String,
         image: String,
         rating: Rating
      
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.descriptionProduct = description
        self.category = category
        self.image = image
        self.rating = rating
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
        descriptionProduct = try container.decode(String.self, forKey: .description)
        category = try container.decode(String.self, forKey: .category)
        image = try container.decode(String.self, forKey: .image)
        rating = try container.decode(Rating.self, forKey: .rating)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(price, forKey: .price)
        try container.encode(descriptionProduct, forKey: .description)
        try container.encode(category, forKey: .category)
        try container.encode(image, forKey: .image)
        try container.encode(rating, forKey: .rating)
        
    }
}
