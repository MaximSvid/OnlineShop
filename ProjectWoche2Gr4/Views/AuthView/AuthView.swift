import SwiftUI

struct AuthView: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            // Hintergrundbild
            Image("backG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 20) {
                if authViewModel.showRegister {
                    registerView
                } else {
                    loginView
                }
            }
            .padding()
            .background(Color.black.opacity(0.5))
            .cornerRadius(20)
            .padding()
        }
    }

    private var loginView: some View {
     
        VStack(spacing: 20) {
           
            TextField("Username", text: $authViewModel.usernameInput)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("Password", text: $authViewModel.passwordInput)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                authViewModel.login(context: context)
            }) {
                Text("Sign In")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
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
                    .foregroundColor(.white)
            }
        }
    }

    private var registerView: some View {
        VStack(spacing: 20) {
            TextField("Username", text: $authViewModel.usernameInput)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("Password", text: $authViewModel.passwordInput)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                authViewModel.register(context: context)
            }) {
                Text("Sign Up")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }

            Button(action: {
                authViewModel.showRegister.toggle()
            }) {
                Text("Already have an account? Sign In")
                    .foregroundColor(.white)
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView(authViewModel: AuthViewModel())
    }
}
