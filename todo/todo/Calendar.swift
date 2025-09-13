//
//  Calendar.swift
//  todo
//
//  Created by Thiri Htet on 13/09/2025.
//

import SwiftUI

struct Calendar: View {
    
    let startAt : Int = 3 //Monday = 0, Tuesday = 1, ... , Sunday = 6
    
    
    @State var dates: [Int] = []
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    let weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
    
    var body: some View {
        ScrollView{
            HStack{
                ForEach(weekdays, id: \.self){weekday in
                    Text(weekday)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(dates, id: \.self){date in
                    
                    if date > 0 {
                        Text("\(date)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .frame(width: 40, height: 60)
                            .background(.pink)
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 10))
                    }else{
                        Text("")
                    }
                    
                    
                }
            }
        }
        .onAppear {
            var initial = 1
            initial -= startAt
            for i in initial...31 {
                dates.append(i)
            }
        }
    }
}

#Preview {
    Calendar()
}


