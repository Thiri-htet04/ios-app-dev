//
//  ContentView.swift
//  Daily-Money
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            Tab("Expense", systemImage: "banknote", value: 0){
                ExpenseScreen()
            }
            Tab("Account", systemImage: "building.columns", value: 1){
                AccountScreen()
            }
        }
        .tabViewStyle(.automatic)
    }
}

#Preview {
    ContentView()
}
