//
//  CheckoutSheetView.swift
//  ProjectWoche2Gr4
//
//  Created by Hamzah on 27.11.24.
//

import SwiftUI

struct CheckoutSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var phoneNumber: String = ""
    @State private var bankNumber: String = ""
    @State private var showAlert = false
    @State private var showEndView = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Information")) {
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    TextField("Bank Number", text: $bankNumber)
                        .keyboardType(.numberPad)
                }

                Button(action: {
                    let userInfo = "Name: \(phoneNumber), Bank: \(bankNumber)"
                    showEndView = true
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Checkout", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
            .fullScreenCover(isPresented: $showEndView) {
                EndView(userInfo: "Name: \(phoneNumber), Bank: \(bankNumber)")
            }
        }
    }
}

struct CheckoutSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSheetView()
    }
}
