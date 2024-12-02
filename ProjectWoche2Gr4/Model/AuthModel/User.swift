//
//  User.swift
//  ProjectWoche2Gr4
//
//  Created by Hamzah on 26.11.24.
//

import Foundation
import SwiftData


@Model
class User{
    var username : String
    var password : String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
