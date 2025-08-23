//
//  ContentView.swift
//  my-bakery
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedFlavor = "Original"
    @State var selectedSize = "Medium"
    @State var addCherry = false
    @State var value = 0.0
    
    
    var body: some View {
        VStack {
            Text("🍒My Bakery🍰")
                .font(.title).bold()
     
            ZStack {
                Image(systemName: "birthday.cake.fill")
                    .font(.system(size: cakeFontSize))
                    .foregroundStyle(cakeColor)
                    .animation(.easeInOut, value: selectedSize)
                    .animation(.bouncy, value: cakeColor)
                
                if addCherry{
                    Text("🍒")
                        .font(.system(size: 50))
                        .animation(.easeIn, value: addCherry)
                }
            }
            .frame(height: 240)
            .offset(y: -24)
            
            VStack (spacing : 15){
                HStack {
                    Text("Flavor")
                    Spacer()
                    Picker("Flavor", selection: $selectedFlavor){
                        Text("Original").tag("Original")
                        Text("Berry").tag("Berry")
                        Text("Cocoa").tag("Cocoa")
                    }
                    .pickerStyle(.menu)
                    .tint(.pink)
                }
                
                
                HStack {
                    Text("Size")
                    Spacer()
                    Picker("Size", selection: $selectedSize){
                        Text("Medium").tag("Medium")
                        Text("Large").tag("Large")
                    }
                    .pickerStyle(.automatic)
                    .tint(.pink)
                }
                
                Toggle("Add Cherry", isOn: $addCherry)
                    .tint(.pink)
                
                
                Text("Sweetness: \(value)%")
                
                Slider(value: $value, in: 0...100){
                    
                }minimumValueLabel: {
                    Text("0")
                }maximumValueLabel: {
                    Text("100")
                }
                    .tint(.pink)
                
                
                Button{
                    randomize()
                }label: {
                    Image(systemName: "arrow.right.circle.fill")
                    Text("Random")
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
            }
            
        }
        .padding(20)
        
    }
    
    private var cakeColor: Color {
            if selectedFlavor == "Original" {
                return .gray
            } else if selectedFlavor == "Berry" {
                return .pink
            } else if selectedFlavor == "Cocoa" {
                return .orange
            } else {
                return .orange
            }
        }
    
    
    private var cakeFontSize: CGFloat {
            selectedSize == "Large" ? 160 : 120
        }
    
    private func randomize(){
        let flavors = ["Original", "Berry", "Cocoa"]
        let size = ["Medium", "Large"]
        
        
        selectedFlavor = flavors.randomElement()!
        selectedSize = size.randomElement()!
        addCherry = Bool.random()
        value = Double.random(in: 0...100)
        
    }

}



#Preview {
    ContentView()
}
