//
//  ExpenseScreen.swift
//  Daily-Money
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct ExpenseScreen: View {
    
    @State var showNewExpense: Bool = false
    @State var expense : Int = 0
    
    var body: some View {
        VStack(spacing: 10){
            Text("Total Expense")
                .font(.title2)
                .fontWeight(.bold)
            Text("\(expense)")
                .font(.system(size: 90))
                .fontWeight(.bold)
            Button("Add New Expense"){
                showNewExpense = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .controlSize(.large)
            .sheet(isPresented: $showNewExpense) {
                AddNewExpense(totalExpense: $expense)
            }
            
            

        }
    }
}

#Preview {
    ExpenseScreen()
}
