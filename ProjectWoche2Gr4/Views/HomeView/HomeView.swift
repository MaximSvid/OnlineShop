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
            VStack (alignment: .leading) {
                ScrollView {
                    
                    TabView {
                        ForEach(homeViewModel.images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .scaledToFit()
                                .frame(height: 290)
                                .clipped()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 150)
                    
                    HStack {
                        Text("Categories")
                            .font(.headline)
                        Spacer()
                    }
                    
                    
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(Category.allCases, id: \.self) { category in
                                VStack(alignment: .leading) {
                                    Image(systemName: category.icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                    
                                    Text(category.title)
                                        .font(.caption)
                                }
                                .padding()
                                .background(.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(
//                                            category == HomeViewModel.selectedCategory ? Color.black : Color.clear, lineWidth: 2
//                                        )
//                                )
//                                .onTapGesture {
//                                    HomeViewModel.selectedCategory = category
//                                }
                            }
                        }
                        .frame(height: 50)
                    }
                    .scrollIndicators(.hidden)
                    
                    HStack {
                        Text("All Goods")
                            .font(.headline)
                        Spacer()
                    }
                    
                    
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            homeViewModel.isSearchVisible.toggle()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Text ("HomeView")
                            .font(.title.bold())
                            .foregroundStyle(.black)
                    }
                }
                .searchable(text: $homeViewModel.searchText, isPresented: $homeViewModel.isSearchVisible, placement: .automatic)
            }
            .padding([.leading, .trailing])
        }
    }
}


#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
