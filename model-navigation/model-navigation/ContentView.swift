//
//  ContentView.swift
//  model-navigation
//
//  Created by Thiri Htet on 30/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var showRed = false
    @State var showGreen = false
    
    var body: some View {
        VStack {
            Button("Show Red"){
                showRed = true
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .tint(.red)
            
            
            Button("Show Green"){
                showGreen = true
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .tint(.green)

        }
        .padding()
        .sheet(isPresented: $showRed){
            RedScreen()
        }
        .fullScreenCover(isPresented: $showGreen) {
            GreenScreen()
        }
    }
}


struct RedScreen : View {

    var body : some View {
        ZStack{
            Color.red
                .ignoresSafeArea()
            Text("Red Screen")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
}

struct GreenScreen : View {
    
    @Environment(\.dismiss) var dismiss
    
    var body : some View {
        ZStack{
            Color.green
                .ignoresSafeArea()
            
            VStack {
                Text("Green Screen")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Button("Close"){
                    dismiss()
                }
                .buttonStyle(.bordered)
            }
        }
    }

    
}

#Preview {
    ContentView()
}
