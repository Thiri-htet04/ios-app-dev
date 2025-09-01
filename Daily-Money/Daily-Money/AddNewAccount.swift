//
//  AddNewAccount.swift
//  Daily-Money
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct AddNewAccount: View {
    
    @State var accountName: String = ""
    var addNewAccount: (String) -> Void = { _ in}
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add New Account")
                .font(.title)
            
            TextField("Account", text: $accountName)
                .textFieldStyle(.roundedBorder)
            
            Button("Add Account"){
                dismiss()
                addNewAccount(accountName)
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(.horizontal)
    }
        
}

#Preview {
    AddNewAccount()
}
