//
//  AttractionRowView.swift
//  Attractions
//
//  Created by Thiri Htet on 16/08/2025.
//

import SwiftUI

struct AttractionRowView: View {
    
    var attraction : AttractionModel
    
    var body: some View {
        HStack{
            Image(attraction.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
            Text(attraction.name)
            Spacer()
        }

    }
}

#Preview {
    AttractionRowView(attraction: AttractionModel(name: "Kew Mae Pan", imageName: "img1"))
}
