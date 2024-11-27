import SwiftUI

@MainActor
class AuthViewModel: ObservableObject { // ich beobachte hier ob der User eingeloggt ist
    @Published var usernameInput = ""
    @Published var passwordInput = ""
    @Published var isLoggedIn = false
    @Published var user: User?
    @Published var loginError: String = ""
    @Published var showRegister = false

    private var authModel: AuthModel {
        return AuthModel(username: usernameInput, password: passwordInput)
    }

    func login() {
        if authModel.validateCredentials() {
            user = User(username: usernameInput, password: passwordInput)
            isLoggedIn = true
            loginError = ""
        } else {
            loginError = "Invalid username or password"
        }
    }

    func register() {
        // Hier Registrierung abfertigen
        user = User(username: usernameInput, password: passwordInput)
        isLoggedIn = true
        loginError = ""
    }

    func logout() {
        isLoggedIn = false
        user = nil
    }
}
