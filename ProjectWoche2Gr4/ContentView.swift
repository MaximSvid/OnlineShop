//
//  ContentView.swift
//  ProjectWoche2Gr4
//
//  Created by Maxim Svidrak on 25.11.24.
//
//Test Start------------------------

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
    
    
    // wir habe TabView3 wie ->login -  homeView -  CardView - favorite
    
    // Loge rigester - login - Authorization (view)
    // Homeview - search - TabsView - Kategorie - wahrenView
    // CardView -> lsit ( delete - favorite )
    // favorite ( delete )
    
    
}

#Preview {
    ContentView()
}
