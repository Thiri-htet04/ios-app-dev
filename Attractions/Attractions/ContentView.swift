//
//  ContentView.swift
//  Attractions
//
//  Created by Thiri Htet on 16/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            
            MapView()
                .frame(height: 250)
            CircleImageView()
                .padding(.top, -100)
            
            //Text description
            VStack(alignment : .leading){
                Text("Kew Mae Pan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack{
                    Text("Doi Intanon National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("Chiang Mai")
                }
                Divider()
                Text("About Kew Mae Pan")
                    .font(.title2)
                    .fontWeight(.medium)
                Text("Kew Mae Pan, in Doi Inthanon National Park, Chiang Mai, is a 3 km nature trail known for its stunning sunrise views, misty valleys, and mountain scenery, making it a popular trekking and photography spot.")
                //                .lineLimit(2)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
