//
//  RandomDemo.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct RandomDemo: View {
    
    @State var value1 = 0
    @State var value2 = 0.0
    @State var value3 = false
    
    var body: some View {
        VStack{
            Text("Value1 : \(value1)")
                .font(.largeTitle)
            Text("Value2 : \(value2)")
                .font(.largeTitle)
            Text("Value3 : \(value3)")
                .font(.largeTitle)
            
            Button("Random"){
                value1 = Int.random(in: 0...100)
                value2 = Double.random(in: 0...100)
                value3 = Bool.random()
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    RandomDemo()
}
