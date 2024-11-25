//
//  HTTPError.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

enum HTTPError: Error {
    case invalidURL, fetchFailed
    
    var message: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .fetchFailed:
            return "Failed to fetch data"
        }
    }
}
