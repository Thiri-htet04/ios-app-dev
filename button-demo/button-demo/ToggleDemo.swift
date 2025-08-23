//
//  ToggleDemo.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct ToggleDemo: View {
    
    @State var wifi = false
    @State var bluetooth = false
    
    var body: some View {
        VStack{
            Form {
                Image(systemName: "wifi")
                    .font(.system(size: 32))
                    .foregroundStyle(wifi ? .green : .gray)
                
                Image(systemName: "network")
                    .font(.system(size: 32))
                    .foregroundStyle(bluetooth ? .green : .gray)
                
                Toggle("Wi-Fi", isOn: $wifi)
                    .tint(.pink)
                Toggle("Bluetooth", isOn: $bluetooth)
            }
            
        }
    }
}

#Preview {
    ToggleDemo()
}
