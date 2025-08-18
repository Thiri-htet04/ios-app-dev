//
//  CircleImageView.swift
//  Attractions
//
//  Created by Thiri Htet on 16/08/2025.
//

import SwiftUI

struct CircleImageView: View {
    
    let imageName: String
    var body: some View {
//        Image(systemName: "photo.stack")
        
        
        ZStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
                .clipShape(Circle())
            Circle()
                .stroke(.white,
                lineWidth: 4)
                .frame(width: 200, height: 200)
        }
        .shadow(radius: 4)
            
    }
}

#Preview {
    CircleImageView(imageName: contents[0].imageName)
}
