import SwiftUI
import CoreImage.CIFilterBuiltins

// Funktion zur QR-Code-Generierung
func generateQRCode(from string: String) -> UIImage? {
    guard let data = string.data(using: String.Encoding.ascii) else {
        return nil
    }

    let filter = CIFilter.qrCodeGenerator()
    filter.message = data

    guard let qrCodeImage = filter.outputImage else {
        return nil
    }

    let context = CIContext()
    guard let cgImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) else {
        return nil
    }

    return UIImage(cgImage: cgImage)
}
import SwiftUI

// EndView
struct EndView: View {
    @Environment(\.presentationMode) var presentationMode
    var userInfo: String
    @State private var qrCodeImage: UIImage? = nil

    var body: some View {
        ZStack {
            // Hintergrundfarbe
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.8), Color.yellow.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)

            VStack(spacing: 40) {
                // Bestätigungsnachricht
                VStack(spacing: 10) {
                    Text("🎉 Vielen Dank!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("Ihr Einkauf ist bestätigt.")
                        .font(.title2)
                        .foregroundColor(.white.opacity(0.9))
                        .multilineTextAlignment(.center)
                }

                // Platzhalter für QR-Code
                if let qrCodeImage = qrCodeImage {
                    Image(uiImage: qrCodeImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.2))
                            .frame(width: 200, height: 200)

                        Text("QR-Code Platzhalter")
                            .font(.headline)
                            .foregroundColor(.white)
                            .opacity(0.8)
                    }
                }

                // Zurück-Button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Zurück 🏠")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.4), radius: 8, x: 0, y: 4)
                }
                .padding(.horizontal, 40)
            }
            .padding()
        }
        .onAppear {
            qrCodeImage = generateQRCode(from: userInfo)
        }
    }
}

struct EndView_Previews: PreviewProvider {
    static var previews: some View {
        EndView(userInfo: "Name: Test User, Bank: 123456789")
    }
}
