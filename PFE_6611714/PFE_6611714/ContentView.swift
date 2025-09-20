//
//  ContentView.swift
//  PFE_6611714
//
//  Created by Thiri Htet on 20/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem {
                    Image(systemName: "movieclapper.fill")
                    Text("Movies")
                }
                .tag(0)
            
            CinemasView()
                .tabItem {
                    Image(systemName: "building")
                    Text("Cinemas")
                }
                .tag(1)
        }
        .accentColor(.blue)
    }
}
#Preview {
    ContentView()
}
