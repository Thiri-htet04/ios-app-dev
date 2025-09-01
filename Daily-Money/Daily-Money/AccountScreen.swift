//
//  AccountScreen.swift
//  Daily-Money
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct Account: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct AccountScreen: View {
    
    @State var accounts: [Account] = [
            .init(name: "Thomas"),
            .init(name: "Jenny")
        ]
    
    @State var showAddAccountView: Bool = false
    @State var addNewAccountName: Bool = false
    
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(accounts, id: \.id) { account in
                    NavigationLink{
                        TransferView(name: account.name)
                    }label: {
                        Text("\(account.name)'s Account")
                    }
                }
               
            }
            .navigationTitle("Accounts")
            .toolbar{
                ToolbarItem (placement: .topBarTrailing) {
                    Button{
                        addNewAccountName = true
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    
                    }
                }
            }
            .sheet(isPresented: $addNewAccountName) {
                AddNewAccount { account in
                    accounts.append(.init(name: account))
                }
            }
        }
    }
}

#Preview {
    AccountScreen()
}
