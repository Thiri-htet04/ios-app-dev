//
//  TransferView.swift
//  Daily-Money
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct TransferView: View {
    
    var name: String
    
    var body: some View {
        VStack {
            Text("💸")
                .font(.system(size: 90))
            Button("Transfer Money to \(name)") {
                
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
            .controlSize(.large)

        }
        .navigationTitle("Transfer")
    }
}

#Preview {
    TransferView(name: "Bob")
}
