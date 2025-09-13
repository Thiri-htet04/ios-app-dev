//
//  Grid.swift
//  todo
//
//  Created by Thiri Htet on 13/09/2025.
//

import SwiftUI

struct Grid: View {
    
    @State var colors : [Color] = []
//    let columns : [GridItem] = [GridItem(.fixed(80)), GridItem(.flexible()), GridItem(.flexible())]
    
//    let columns : [GridItem] = [GridItem(.adaptive(minimum: 80))]
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    let rows: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
     
    var body: some View {
        VStack {
            ScrollView(.horizontal){
                LazyHGrid(rows: rows) {
                    ForEach(colors.indices, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 100)
                            .foregroundStyle(colors[index])
                    }
                }
//                LazyVGrid(columns: columns) {
//                    ForEach(colors.indices, id: \.self){index in
//                        RoundedRectangle(cornerRadius: 12)
//                            .frame(height: 100)
//                            .foregroundStyle(colors[index])
//                    }
//                }
            }
        }
        .padding()
        .onAppear {
            for _ in 0..<50 {
                colors.append([Color.red, Color.green, Color.blue].randomElement()!)
            }
        }
        
    }
}

#Preview {
    Grid()
}
