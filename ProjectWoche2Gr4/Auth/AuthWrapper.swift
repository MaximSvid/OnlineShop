//
//  AuthWrapper.swift
//  ProjectWoche2Gr4
//
//  Created by Hamzah on 26.11.24.
//

import SwiftUI

struct AuthWrapper: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        if authViewModel.isLoggedIn {
            AppNavigation(authViewModel: authViewModel)
        } else {
            AuthView()
        }
    }
}
