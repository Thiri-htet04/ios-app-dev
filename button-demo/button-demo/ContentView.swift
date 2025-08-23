//
//  ContentView.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var score = 0
    
    var body: some View {
        VStack {
            Text("\(score)")
                .font(.system(size: 60))
                .padding(.bottom)
            Button("Basic Button") {
                score += 1
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Button {
                score -= 1
            } label: {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Icon Button")
                }
            }
            .padding()
            .foregroundStyle(.white)
            .background(.orange)
            .clipShape(.rect(cornerRadius: 12))
//            .clipShape(.capsule)
            
            Button {
                
            } label: {
                Text("Border Only")
                    .padding()
                    .foregroundStyle(.purple)
                    .overlay{
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.purple, lineWidth: 2)
                    }
            }
            
            

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
