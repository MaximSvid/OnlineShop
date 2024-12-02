//
//  CategoryView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 02.12.24.
//
import SwiftUI

struct CategoryView: View {
    let categories: [Category]
    @Binding var selectedCategory: Category?
    let filterByCategory: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(.headline)
                Spacer()
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        VStack(alignment: .leading) {
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            Text(category.title)
                                .font(.caption)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedCategory == category ? Color.black.opacity(0.3) : Color.gray.opacity(0.1))
                        )
                        .onTapGesture {
                            if selectedCategory == category {
                                selectedCategory = nil
                            } else {
                                selectedCategory = category
                            }
                            filterByCategory()
                        }
                    }
                }
                .frame(height: 50)
            }
            .scrollIndicators(.hidden)
        }
    }
}
