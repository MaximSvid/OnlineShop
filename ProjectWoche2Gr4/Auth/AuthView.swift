import SwiftUI

struct AuthView: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            VStack(spacing: 30) {
                TextField(
                    "Username",
                    text: $authViewModel.usernameInput
                )
                .textFieldStyle(RoundedBorderTextFieldStyle()) // Hier den Stil angeben

                SecureField(
                    "Password",
                    text: $authViewModel.passwordInput
                ).textFieldStyle(RoundedBorderTextFieldStyle()) // Hier den Stil angeben

                if authViewModel.showRegister {
                    Button {
                        authViewModel.register {
                            // Hier kannst du weitere Aktionen nach der Registrierung ausführen
                        }
                    } label: {
                        Text("Register")
                            .frame(maxWidth: .infinity)
                    }.buttonStyle(.borderedProminent)
                        .tint(.black)
                } else {
                    Button {
                        authViewModel.login {
                            // Hier kannst du weitere Aktionen nach dem Login ausführen
                        }
                    } label: {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                    }.buttonStyle(.borderedProminent)
                        .tint(.black)
                }

                Button(authViewModel.showRegister ? "Zurück zum Login" : "Hier registrieren") {
                    authViewModel.showRegister.toggle()
                }.font(.headline)
                    .foregroundStyle(.yellow)

            }.padding(40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("Clouds").blur(radius: 20))
    }
}


struct preview: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
