//
//  ProductCardView.swift
//  ProjectWoche2Gr4
//
//  Created by vilo vood on 25.11.24.
//
import SwiftUI

struct ProductCard: View {
    //var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            ZStack(alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                
                VStack(alignment: .leading){
                    Text(product.name)
                        .bold()
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, Alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button{
                
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
        
    }
}



