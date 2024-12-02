import SwiftUI

struct CheckoutSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cartViewModel: CartViewModel
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
                    HeaderView()

                    // Formular
                    ContactInformationForm(name: $name, phoneNumber: $phoneNumber, bankNumber: $bankNumber, birthdate: $birthdate, address: $address)

                    // Submit-Button
                    SubmitButton(showEndView: $showEndView, name: name, phoneNumber: phoneNumber, bankNumber: bankNumber, birthdate: birthdate, address: address)

                    Spacer()
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Checkout", displayMode: .inline)
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
            .fullScreenCover(isPresented: $showEndView) {
                EndView(cartViewModel: cartViewModel, userInfo: generateUserInfo())
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

    // Helper function to generate user info
    private func generateUserInfo() -> String {
        let formattedBirthdate = formatDate(birthdate)
        return "Name: \(name), Phone: \(phoneNumber), Bank: \(bankNumber), Birthdate: \(formattedBirthdate), Address: \(address)"
    }
}

// HeaderView Component
struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Checkout")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding()
    }
}

// ContactInformationForm Component
struct ContactInformationForm: View {
    @Binding var name: String
    @Binding var phoneNumber: String
    @Binding var bankNumber: String
    @Binding var birthdate: Date
    @Binding var address: String

    var body: some View {
        Form {
            Section(header: Text("Contact Information").foregroundColor(.black)) {
                CustomTextField(image: "person.fill", placeholder: "Name", text: $name)
                CustomTextField(image: "phone.fill", placeholder: "Phone Number", text: $phoneNumber, keyboardType: .phonePad)
                CustomTextField(image: "creditcard.fill", placeholder: "Bank Number", text: $bankNumber, keyboardType: .numberPad)
                CustomDatePicker(label: "Birthdate", selection: $birthdate)
                CustomTextField(image: "house.fill", placeholder: "Address", text: $address)
            }
        }
        .padding(.horizontal)
    }
}

// CustomTextField Component
struct CustomTextField: View {
    let image: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        HStack {
            Image(systemName: image)
                .foregroundColor(.black)
                .padding(.trailing, 8)
            TextField(placeholder, text: $text)
                .foregroundColor(.black)
                .padding(.vertical, 8)
                .keyboardType(keyboardType)
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

// CustomDatePicker Component
struct CustomDatePicker: View {
    let label: String
    @Binding var selection: Date

    var body: some View {
        HStack {
            Image(systemName: "calendar")
                .foregroundColor(.black)
                .padding(.trailing, 8)
            DatePicker(label, selection: $selection, displayedComponents: .date)
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
    }
}

// SubmitButton Component
struct SubmitButton: View {
    @Binding var showEndView: Bool
    var name: String
    var phoneNumber: String
    var bankNumber: String
    var birthdate: Date
    var address: String

    var body: some View {
        Button(action: {
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
    }
}

struct CheckoutSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutSheetView(cartViewModel: CartViewModel())
    }
}

