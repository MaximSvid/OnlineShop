//
//  HomeView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//
//Test

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel:  HomeViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                TabView {
                    ForEach(homeViewModel.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .scaledToFit()
                            .frame(height: 250)
                            .clipped()
                            
                            
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 150)

            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "bell.fill")
                            .foregroundStyle(.gray)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Text ("HomeView")
                            .font(.title.bold())
                            .foregroundStyle(.black)
                    }
                }


            }
        }
        
    }
}


#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
