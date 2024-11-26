import SwiftUI

struct AuthView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            if authViewModel.showRegister {
                registerView
            } else {
                loginView
            }
        }
        .padding()
    }

    private var loginView: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $authViewModel.usernameInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $authViewModel.passwordInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                authViewModel.login()
            }) {
                Text("Sign In")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if !authViewModel.loginError.isEmpty {
                Text(authViewModel.loginError)
                    .foregroundColor(.red)
                    .padding()
            }

            Button(action: {
                authViewModel.showRegister.toggle()
            }) {
                Text("Don't have an account? Sign Up")
                    .foregroundColor(.blue)
            }
        }
    }

    private var registerView: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $authViewModel.usernameInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $authViewModel.passwordInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                authViewModel.register()
            }) {
                Text("Sign Up")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Button(action: {
                authViewModel.showRegister.toggle()
            }) {
                Text("Already have an account? Sign In")
                    .foregroundColor(.blue)
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(authViewModel: AuthViewModel())
    }
}
