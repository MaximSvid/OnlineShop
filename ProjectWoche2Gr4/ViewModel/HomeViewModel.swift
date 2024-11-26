//
//  HomeViewModel.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var images = ["image1", "image2", "image3", "image4"]
    @Published var searchText: String = ""
    @Published var isSearchVisible: Bool = false
    @Published var selectedCategory: Bool = false
    
    
    
}
