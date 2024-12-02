import SwiftUI
import SwiftData

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

    func login(context: ModelContext) {
        let fetchDescription = FetchDescriptor<User>(
            predicate: #Predicate {
                $0.username == usernameInput && $0.password == passwordInput
            }
        )
        do {
            let users = try context.fetch(fetchDescription)
            if let loggedInUser = users.first {
                user = loggedInUser
                isLoggedIn = true
                loginError = ""
            } else {
                loginError = "Invalid username or password"
            }
        } catch {
            loginError = "Error fetching users: \(error)"
        }
    }
    
    func register(context: ModelContext) {
        let fetchDescription = FetchDescriptor<User>(
            predicate: #Predicate {
                $0.username == usernameInput
            }
        )
        do {
            let users = try context.fetch(fetchDescription)
            if users.isEmpty {
                user = User(username: usernameInput, password: passwordInput)
                isLoggedIn = true
            } else {
                loginError = "Username already taken"
            }
        } catch {
            loginError = "Error fetching users: \(error)"
        }
    }
//    func login(context: ModelContext) {
//        if authModel.validateCredentials() {
//            user = User(username: usernameInput, password: passwordInput)
//            isLoggedIn = true
//            loginError = ""
//        } else {
//            loginError = "Invalid username or password"
//        }
//    }
//
//    func register(context: ModelContext) {
//        // Hier Registrierung abfertigen
//        user = User(username: usernameInput, password: passwordInput)
//        isLoggedIn = true
//        loginError = ""
//    }

    func logout() {
        isLoggedIn = false
        user = nil
    }
}
