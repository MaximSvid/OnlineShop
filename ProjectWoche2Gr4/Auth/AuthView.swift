import SwiftUI

struct AuthView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
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
        }
        .padding()
    }
}
//
//struct AuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthView()
//    }
//}
