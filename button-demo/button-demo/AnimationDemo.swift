//
//  AnimationDemo.swift
//  button-demo
//
//  Created by Thiri Htet on 23/08/2025.
//

import SwiftUI

struct AnimationDemo: View {
    
    @State var scale = CGSize(width: 1, height: 1)
    @State var color = Color.white
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            VStack{
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(color)
                    .font(.system(size: 80))
                    .scaleEffect(scale)
                    .animation(.easeIn, value: scale)
                    .animation(.bouncy, value: color)
                
                VStack (spacing : 20) {
                    HStack (spacing : 20) {
                        Button {
                            scale.width += 0.2
                            scale.height += 0.2
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 60))
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button {
                            scale.width -= 0.2
                            scale.height -= 0.2
                        }label : {
                            Image(systemName: "minus")
                                .font(.system(size: 60))
                                .frame(height: 60)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    
                    Button("Color the Sun"){
                        color = [Color.white, Color.red, Color.green].randomElement()!
                    }
                    .controlSize(.large)
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }
            }
        }
    }
}

#Preview {
    AnimationDemo()
}
