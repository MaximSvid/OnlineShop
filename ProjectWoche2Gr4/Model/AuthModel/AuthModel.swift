//
//  AuthModel.swift
//  ProjectWoche2Gr4
//
//  Created by Hamzah on 26.11.24.
//

import SwiftUI
import Combine

// AuthModel
struct AuthModel {
    var username: String
    var password: String

    func validateCredentials() -> Bool {
        return username == "123" && password == "123"
    }
}
