//
//  ModelDemo.swift
//  model-navigation
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct Message: Identifiable{
    var id : UUID = UUID()
    var value : String
}

struct ModelDemo: View {
    
    @State var textFieldValue = ""
    @State var message: Message?
    
    var body: some View {
        VStack{
            TextField("Enter a color", text: $textFieldValue)
                .textFieldStyle(.roundedBorder)
            Button("Show Color"){
                message = Message(value: textFieldValue)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .sheet(item: $message){ item in
            AnyColorScreen(message: item)
        }
    }
}


struct AnyColorScreen : View {
    
    var message : Message
    
    var body : some View {
        ZStack{
            if message.value.lowercased() == "red" {
                Color.red
                    .ignoresSafeArea()
            }else if message.value.lowercased() == "blue" {
                Color.blue
                    .ignoresSafeArea()
            }else if message.value.lowercased() == "green" {
                Color.green
                    .ignoresSafeArea()
            }else{
                Color.black
                    .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ModelDemo()
}
