//
//  ToolbarItems.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 02.12.24.
//

import SwiftUI

struct ToolbarItems: ToolbarContent {
    @Binding var isSearchVisible: Bool
    @Binding var searchText: String
    let toggleSearch: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            Button {
                toggleSearch()
            } label: {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
            }
        }
        
        ToolbarItemGroup(placement: .navigationBarLeading) {
            Text("HomeView")
                .font(.title.bold())
                .foregroundStyle(.black)
        }
    }
}
