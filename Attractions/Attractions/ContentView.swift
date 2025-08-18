//
//  ContentView.swift
//  Attractions
//
//  Created by Thiri Htet on 16/08/2025.
//

import SwiftUI

struct ContentView: View {
    
    
    var content : ContentModel

    var body: some View {
        VStack{
            
            MapView(coordinate : content.coordinate)
                .frame(height: 200)
            CircleImageView(imageName: content.imageName)
                .padding(.top, -100)
            
            //Text description
            VStack(alignment : .leading){
                Text(content.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack{
                    Text(content.place)
                        .font(.subheadline)
                    Spacer()
                    Text(content.city)
                }
                Divider()
                Text("About \(content.name)")
                    .font(.title2)
                    .fontWeight(.medium)
                Text(content.description)
                //                .lineLimit(2)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView(content: contents[0])
}
