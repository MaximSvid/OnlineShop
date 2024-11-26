//
//  AuthViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Hamzah on 26.11.24.
//

import SwiftUI

@MainActor
class AuthViewModel: ObservableObject {
    @Published var usernameInput = ""
    @Published var passwordInput = ""
    @Published var showRegister = false
    @Published var isLoggedIn = false
    @Published var user: User?

    func login(onSuccess: () -> Void) {
        // Hier richtiger Check für Login
        if usernameInput == "Admin" && passwordInput == "123" {
            user = User(username: usernameInput, password: passwordInput)
            isLoggedIn = true
            onSuccess()
        }
    }

    func register(onSuccess: () -> Void) {
        // Hier Registrierung abfertigen
        user = User(username: usernameInput, password: passwordInput)
        isLoggedIn = true
        onSuccess()
    }
}
