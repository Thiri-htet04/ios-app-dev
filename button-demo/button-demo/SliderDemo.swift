//
//  SliderDemo.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct SliderDemo: View {
    @State var value : Double = 0
    
    var body: some View {
         Form {
            Slider(value: $value, in: 0...100)
            Slider(value: $value, in: 0...100){
                Text("My Slider")
            }minimumValueLabel: {
                Text("0")
            }maximumValueLabel: {
                Text("100")
            }
            .tint(.pink)
        }
    }
}

#Preview {
    SliderDemo()
}
