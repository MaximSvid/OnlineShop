//
//  Rating.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//


import SwiftData
@Model

class Rating: Codable {
    var rate: Double
    var count: Int
    
    enum CodingKeys: String, CodingKey {
        case rate = "rate"
        case count = "count"
    }
    
    init(
        rate: Double,
         count: Int
    ) {
        self.rate = rate
        self.count = count
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        rate = try container.decode(Double.self, forKey: .rate)
        count = try container.decode(Int.self, forKey: .count)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(rate, forKey: .rate)
        try container.encode(count, forKey: .count)
    }
}
