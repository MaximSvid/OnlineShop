//
//  SettingsView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 26.11.24.
//
import SwiftUI

struct SettingView: View {
    var user: User?

    var body: some View {
        VStack {
            if let user = user {
                Text("Welcome, \(user.username)")
                    .font(.largeTitle)
                    .padding()
                Text("Your password is: \(user.password)")
                    .font(.title)
                    .padding()
            } else {
                Text("No user logged in")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(user: nil)
    }
}
