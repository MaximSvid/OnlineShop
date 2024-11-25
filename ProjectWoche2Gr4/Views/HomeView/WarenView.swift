//
//  WarenView.swift
//  ProjectWoche2Gr4
//
//  Created by vilo vood on 25.11.24.
//

import SwiftUI

struct WarenView: View {
    @State private var isLiked: Bool = false
    
    var wareImage: String // Der Name des Bildes in den Assets
    var wareName: String
    var warePrice: Double
    
    var body: some View {
        VStack(spacing: 16) {
            // Ware Image
            Image("Focus")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            
            // Ware Name und Preis
            VStack(spacing: 4) {
                Text(wareName)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                Text(String(format: "%.2f €", warePrice))
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            
            // Like/Unlike Button
            Button(action: {
                isLiked.toggle()
            }) {
                HStack {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                    Text(isLiked ? "Unlike" : "Like")
                        .foregroundColor(.primary)
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .shadow(radius: 5)
            }
        }
        .padding()
    }
}

// Preview
struct WarenView_Previews: PreviewProvider {
    static var previews: some View {
        WarenView(
            wareImage: "exampleImage", // Platzhalter für das Bild in deinen Assets
            wareName: "Stylisches T-Shirt",
            warePrice: 29.99
        )
        .previewLayout(.sizeThatFits)
    }
}

