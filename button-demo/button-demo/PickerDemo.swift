//
//  PickerDemo.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct PickerDemo: View {
    
    @State var bgColor = Color.blue
    @State var name = ""
    @State var age = ""
    
    var body: some View {
        ZStack{
            bgColor
                .ignoresSafeArea()
            
            VStack {
                Text("Change Color")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                
                Form {
                    Section("Settings") {
                        Picker("Background Color", selection: $bgColor){
                            Text("Black").tag(Color.black)
                            Text("Red").tag(Color.red)
                            Text("Green").tag(Color.green)
                            Text("Blue").tag(Color.blue)
                        }
                        .pickerStyle(.automatic)
                    }
                    
                    
                    Section("Personal Info") {
                        TextField("Name", text: $name)
                        TextField("Age", text: $age)
                    }
                }
            }
        }
    }
}

#Preview {
    PickerDemo()
}
