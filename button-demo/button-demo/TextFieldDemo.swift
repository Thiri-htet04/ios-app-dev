//
//  TextFieldDemo.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct TextFieldDemo: View {
    
    @State var name = ""
    @State var age = ""
    var body: some View {
        VStack{
            Text("Hello, I'm \(name) and I am \(age) years old!")
            TextField("Name", text : $name)
                .textFieldStyle(.roundedBorder)
            TextField("Age", text: $age)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    TextFieldDemo()
}
