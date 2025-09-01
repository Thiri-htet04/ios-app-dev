//
//  TabViewScreen.swift
//  model-navigation
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct TabViewScreen: View {
    
    @State var currentTab =  0
    
    var body: some View {
        TabView (selection: $currentTab){
            Tab("Numbers", systemImage: "number", value: 0){
                NumberScreen(currentTab: $currentTab)
            }
            .badge(99)
            
            Tab("Letters", systemImage: "character", value: 1){
                LetterScreen(currentTab: $currentTab)
            }
        }
        .tabViewStyle(.automatic)
    }
}



struct NumberScreen: View {
    
    @Binding var currentTab : Int
    
    var body: some View {
        VStack {
            Text("Number")
                .font(.title)
            Text("99")
                .font(.system(size: 60))
                .fontWeight(.bold)
            Button("Go to Letters"){
                currentTab = 1
            }
            
            NavigationLink("Go to Detail"){
                Text("Welcome to Detail")
            }
        }
        .navigationTitle("Number")
    }
}


struct LetterScreen: View {
    
    @Binding var currentTab : Int
    
    var body: some View {
        VStack {
            Text("Letter")
                .font(.title)
            Text("A")
                .font(.system(size: 60))
                .fontWeight(.bold)
            
            Button("Go to Numbers"){
                currentTab = 0
            }
        }
    }
}

#Preview {
    TabViewScreen()
}
