//
//  HomeDetailView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI



struct HomeDetailView: View {
    @State private var selectedSize: Int? = 40

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Produktbild
                Image("shoe_image") // Ersetze "shoe_image" mit deinem Bildnamen
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
                    .padding(.horizontal)


                // Produktname und Preis
                VStack(alignment: .leading, spacing: 8) {
                    Text("Nike Basketball Shoes")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("$272")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                // Produktbeschreibung
                VStack(alignment: .leading, spacing: 8) {
                    Text("They are a cross between the Air Force 1, the Air Jordan and the Nike Terminator. The first model came out in 1985 and was called Dunk in honour of the players' feats...")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)

                Spacer()

                // "Buy Now" Button
                Button(action: {
                    // Kaufaktion hier einfügen
                }) {
                    Text("Buy Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.purple)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // Zurück-Button-Aktion
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Herz-Button-Aktion
                }) {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct HomeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeDetailView()
        }
    }
}

