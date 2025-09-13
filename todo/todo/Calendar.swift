//
//  Calendar.swift
//  todo
//
//  Created by Thiri Htet on 13/09/2025.
//

import SwiftUI

struct Calendar: View {
    
    @State var dates: [Int] = []
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(dates, id: \.self){date in
                    Text("\(date)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .frame(width: 40, height: 60)
                        .background(.pink)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 10))
                    
                }
            }
        }
        .onAppear {
            for i in 1...31 {
                dates.append(i)
            }
        }
    }
}

#Preview {
    Calendar()
}
