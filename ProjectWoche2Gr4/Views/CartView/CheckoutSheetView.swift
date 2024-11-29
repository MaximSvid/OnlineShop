import SwiftUI

struct CheckoutSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var bankNumber: String = ""
    @State private var birthdate: Date = Date()
    @State private var address: String = ""
    @State private var showEndView = false

    var body: some View {
        NavigationView {
            ZStack {
                // Hintergrundfarbe
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    // Titel und Beschreibung
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Checkout")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding()

                    // Formular
                    Form {
                        Section(header: Text("Contact Information").foregroundColor(.black)) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                                TextField("Name", text: $name)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                            }
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )

                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                                TextField("Phone Number", text: $phoneNumber)
                                    .keyboardType(.phonePad)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                            }
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )

                            HStack {
                                Image(systemName: "creditcard.fill")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                                TextField("Bank Number", text: $bankNumber)
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                            }
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )

                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                                DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                                    .labelsHidden()
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .accentColor(.black)
                            }
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )

                            HStack {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.black)
                                    .padding(.trailing, 8)
                                TextField("Address", text: $address)
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                            }
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(8)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal)
                    
                    

                    // Submit-Button
                    Button(action: {
                        let formattedBirthdate = formatDate(birthdate)
                        let userInfo = "Name: \(name), Phone: \(phoneNumber), Bank: \(bankNumber), Birthdate: \(formattedBirthdate), Address: \(address)"
                        showEndView = true
                    }) {
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)

                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Checkout", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
            .fullScreenCover(isPresented: $showEndView) {
                EndView(userInfo: "Name: \(name), Phone: \(phoneNumber), Bank: \(bankNumber), Birthdate: \(formatDate(birthdate)), Address: \(address)")
            }
        }
    }

    // Helper function to format the date
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct CheckoutSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSheetView()
    }
}

