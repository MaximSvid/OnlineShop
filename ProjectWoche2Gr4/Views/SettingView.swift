import SwiftUI

struct SettingView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @State private var showPassword = false

    var body: some View {
        VStack {
            // Hintergrundbild
           
            Image("setting")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
                .overlay(
                  

                    VStack {
                        Text("Welcome")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        Spacer()

                        VStack(spacing: 20) {
                           
                            if let user = authViewModel.user {
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text("Username:")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text(user.username)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }

                                    HStack {
                                        Text("Password:")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Spacer()
                                        if showPassword {
                                            Text(user.password)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                        } else {
                                            Text(String(repeating: "•", count: user.password.count))
                                                .font(.headline)
                                                .foregroundColor(.white)
                                        }
                                        Button(action: {
                                            showPassword.toggle()
                                        }) {
                                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                                .foregroundColor(.white)
                                        }
                                    }

                                    // Weitere Informationen können hier hinzugefügt werden
                                    HStack {
                                        Text("Email:")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("example@example.com") // Beispiel-E-Mail
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }

                                    HStack {
                                        Text("Phone:")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("+123 456 7890") // Beispiel-Telefonnummer
                                            .font(.headline)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding()
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(10)
                            }
                        }
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .cornerRadius(20)
                        .padding()

                        Spacer()

                        Button(action: {
                            authViewModel.logout()
                        }) {
                            Text("Log Out")
                                .font(.title3)
                                .foregroundColor(.black)
                                .frame(width: 150)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                )
        }
    }
}


struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(authViewModel: AuthViewModel())
    }
}
