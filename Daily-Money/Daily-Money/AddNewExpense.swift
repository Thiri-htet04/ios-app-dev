//
//  AddNewExpense.swift
//  Daily-Money
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct AddNewExpense: View {
    
    @State var amount: String = ""
    @Binding var totalExpense: Int
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (spacing: 20){
            Text("New Expense")
                .font(.title)
            TextField("How much?", text : $amount )
                .textFieldStyle(.roundedBorder)
            
            Button("Save"){
                totalExpense += Int(amount) ?? 0
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(.horizontal)
        
        

    }
}

#Preview {
    AddNewExpense(totalExpense: .constant(0))
}
